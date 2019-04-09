#!/usr/bin/env python3

import re
import sys

p = re.compile(r'[A-Za-z0-9.;/?:@&=+$,-_.!~*\'()]')
print (''.join(set(p.sub('', sys.argv[1]))))
