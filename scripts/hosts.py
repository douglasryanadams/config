#!/usr/bin/env python3

import urllib.request
import shutil
import re

print("Beginning to evaluate hosts files ...")

hosts_url = "http://winhelp2002.mvps.org/hosts.txt"
hosts_path = "/etc/hosts"
special = '### -- Begin 3rd Party Records -- ###'
comment_pattern = re.compile('^(#|\s).*$')
safe_pattern = re.compile('^0\.0\.0\.0.*$')
special_pattern = re.compile('^' + special + '$')

def get_remote_hosts():
    print("Retrieving remote hosts file ...")
    file_handle = urllib.request.urlopen(hosts_url)
    remote_content = []
    for line_bytes in file_handle:
        line = str(line_bytes, 'utf8').rstrip() 
        if not comment_pattern.match(line) and safe_pattern.match(line):
            remote_content.append(line)
    file_handle.close()
    print("... done retrieving remote hosts file.")
    return remote_content

def get_local_hosts():
    print("Reading local hosts file ...")
    file_handle = open(hosts_path, 'r')
    other_lines = []
    local_content = []
    special_line_found = False
    for line in file_handle:
        line = line.rstrip()
        if special_pattern.match(line):
            special_line_found = True
            continue
        if special_line_found:
            if not comment_pattern.match(line):
                local_content.append(line)
        else:
            other_lines.append(line)
    file_handle.close()
    if not special_line_found:
        print("-- Special line not found, creating backup")
        shutil.copy(hosts_path, hosts_path + ".bak")
    print("... done reading local hosts file.")
    return (other_lines, local_content)

def update_necessary(remote_content, local_content):
    print("-- Checking to see if updating the hosts file is necessary")
    if not len(remote_content) == len(local_content):
        return True
    for i, line in enumerate(remote_content):
        if not local_content[i] == line:
            return True
    return False

def create_new_hosts(remote_content, other_lines):
    print("Creating new hosts file ...")
    other_lines.append(special)
    content = other_lines + remote_content
    file_handle = open(hosts_path, 'w')
    for line in content:
        file_handle.write(''.join((line,'\n')))
    file_handle.close()
    print("... done creating new hosts file.")

def main():
    remote_content = get_remote_hosts()
    other_lines, local_content = get_local_hosts()
    if update_necessary(remote_content, local_content):
        create_new_hosts(remote_content, other_lines)
    if False:
        print("-- REMOTE CONTENT --")
        print('\n'.join(remote_content[:10]))
        print("-- OTHER LINES --")
        print('\n'.join(other_lines[:10]))
        print("-- LOCAL CONTENT --")
        print('\n'.join(local_content[:10]))

main()

print("... done evaluating hosts files.")
