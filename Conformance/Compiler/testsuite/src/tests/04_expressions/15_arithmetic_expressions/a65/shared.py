# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

from os import path

types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64']
type_info = { ty : {} for ty in types }
for ty in types:
  ti = type_info[ty]
  ti['bits'] = int(ty[ty.index('t')+1:])
  ti['suffix'] = ty[0].lower() + str(ti['bits'])
  ti['signed'] = ty[0] is not 'U'
  ti['min'] = 0 if not ti['signed'] else -2**(ti['bits'] - 1)
  ti['max'] = str(ti['min'] + 2**ti['bits'] - 1) + ti['suffix']
  ti['min'] = str(ti['min']) + ti['suffix']

operator_info = {
  '+' : [['min', 'min'], ['max', 'max']],
  '-' : [['min', 'max'], ['max', 'min']],
  '*' : [['min', 'max'], ['max', 'max']]
}
path = path.dirname(path.realpath(__file__)) + '/test_a65_{}.cj'