#!/usr/bin/python

"""
This file will take a template and sls files and print out the compiled version of a jinja template.

Usage: python jinja_test_compile.py {filepath} {pillar files ...}
"""

import sys

import jinja2
import yaml

jinja_file = sys.argv[1]
pillar_file = sys.argv[2]

jinja_content = open(jinja_file, 'r').read()
pillar_data = yaml.load(open(pillar_file, 'r').read())


def pillar_get(pillar_chain, default=None):
    parts = pillar_chain.split(':')
    i = iter(parts)
    placeholder = pillar_data

    while True:
        try:
            placeholder = placeholder[i.next()]
        except StopIteration:
            break

    return placeholder if placeholder is not None else default

salt = {
    'pillar.get': pillar_get
}

environment = jinja2.Environment()
rendered_content = environment.from_string(jinja_content).render(salt=salt)

print(rendered_content)