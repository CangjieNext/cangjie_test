# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os import path

types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64']
dir = path.dirname(path.realpath(__file__))
path = dir + '/test_' + path.basename(dir) + '_{}.cj'
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.18(8) Note that the type of two operands may be different.
  @Description: Checks that using the following combinations of << and >> with operand types, which are not the same,
                is permitted.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

from utils import utils.assert.Assert

main() {{
{}
}}
'''
positive_replacement = '\n'.join(['    Assert.equals({}, {}(1) {} {}(1))'.format(0 if op == '>>' else 2, t1, op, t2)
                                  for op in ['<<', '>>'] for t1 in types for t2 in types if t1 != t2])

counter = 1
with open(path.format(str(counter).zfill(2)), 'w') as file:
  file.write(template.format(positive_replacement))
