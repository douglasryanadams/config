#!/usr/bin/python

"""
This file will print out all of the templated variables and their defaults for a given jinja template file.
    - This requires use of the construct salt['pillar.get']('pillar_path', 'default')

If the template has a syntax error, this script throw an exception.

Usage: python jinja_get_vars.py {filepath}
"""

import sys

import jinja2
import pyaml

chains = dict()
potential_config = dict()


def pillar_get(pillar_chain, default=None):
    chains[pillar_chain] = default
    return '<another_pillar_value>'


def network_interfaces():
    return {'<another_pillar_value>': {'inet': {0: {'address': '<hosts_native_address>'}}}}


salt = {
    'pillar.get': pillar_get,
    'network.interfaces': network_interfaces
}

environment = jinja2.Environment()
f = open(sys.argv[1])
content = f.read()
environment.from_string(content).render(salt=salt)

for chain, default in chains.iteritems():
    parts = chain.split(':')
    i = iter(parts)
    last_dict = None
    previous_key = None
    previous_dict = dict()
    while True:
        try:
            current_key = i.next()

            if not previous_key:
                previous_dict = potential_config

            if current_key not in previous_dict:
                previous_dict[current_key] = dict()

            last_dict = previous_dict
            previous_dict = previous_dict[current_key]
            previous_key = current_key
        except StopIteration:
            last_dict[previous_key] = default
            break

print(pyaml.dump(potential_config))
