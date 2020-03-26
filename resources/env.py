import os
from os import environ

with open("/tmp/default.env", "r") as a_file:
  for line in a_file:
    split_line = line.strip().split('=', 1)
    name = split_line[0]
    val = split_line[1]

    if environ.get(name) is None:
        print('export ' + name + '="' + val.strip('"') + '"')
