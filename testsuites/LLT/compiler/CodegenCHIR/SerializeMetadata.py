# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/bin/python3
import sys

# config option
metadata_keys = ['pkg_info', 'types', 'global_variables', 'functions']
enable_wrap_line = False


if len(sys.argv) <= 1:
    print('help: SerializeIR.py in.ll [out.txt]\n\tin.ll is input *.ll file\n\t[out.txt] if set, will save output to out.txt')
    exit(1)
filename = sys.argv[1]
save_2_file = ''
if len(sys.argv) == 3:
    save_2_file = sys.argv[2]

try:
    f = open(filename)
except IOError:
    print(filename, 'open fialed.')

if len(save_2_file) != 0:
    out = open(save_2_file, 'w')

lines = f.readlines()

def tab_str(scope_depth):
    if enable_wrap_line:
        return '\n' + '    ' * scope_depth
    else:
        return ''

def find_line_by_key(key):
    for line in lines:
        # !key = !{...}
        if line.startswith(key + ' = '):
            return line[line.find('!{'):]
    return ''

def parse_value(v, scope_depth):
    # print('parse_value in')
    if len(v) == 0:
        return v
    # remove '!{' and '}\n'
    rawV = v[2:-2]
    rawKeys = rawV.split(', ')
    serialization = '!{'
    scope_depth = scope_depth + 1
    # print(rawKeys)
    for rawKey in rawKeys:
        # print(rawKey)
        serialization += tab_str(scope_depth)
        value = find_line_by_key(rawKey)
        if len(value) == 0:
            serialization += rawKey
        else:
            serialization += parse_value(value, scope_depth)
        if rawKey != rawKeys[-1]:
            serialization += ', '
    # serialization = serialization[:-2]
    scope_depth -= 1
    serialization += tab_str(scope_depth)
    serialization += '}'
    # print('parse_value out', serialization)
    return serialization

for key in metadata_keys:
    serialization = '!' + key + ' = '
    value = find_line_by_key('!' + key)
    # print(key, value)
    scope_depth = 0
    serialization += parse_value(value, scope_depth) + '\n'
    if len(save_2_file) != 0:
        out.write(serialization)
    else:
        print(serialization)


f.close()
if len(save_2_file) != 0:
    out.close()
