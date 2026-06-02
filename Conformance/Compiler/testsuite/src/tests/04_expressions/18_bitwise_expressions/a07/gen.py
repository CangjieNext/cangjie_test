# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os import path
import itertools
import random

integer_types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64']
types = integer_types + ['Float16', 'Float32', 'Float64', 'String', 'Rune', 'Bool', 'Unit', '(Int8, Int8)', 'Array<Int8>', 'C']
default_value_map = {'Bool' : 'true', 'Unit' : '()', 'Array<Int8>' : '[]', 'Rune' : "'1'", 'String' : '"1"', '(Int8, Int8)' : '(1, 1)', 'C' : 'C()'}
def default_value(ty : str) -> str:
  if ty in integer_types: return '1'
  if 'Float' in ty: return '1.0'
  return default_value_map[ty]

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
  @Assertion:   4.18(7) The operands of bitwise left/right shift operator must be of type integer.
  @Description: Checks that using operator {op} with types {t1} and {t2} is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/
{}
main() {{
    var v1 : {t1} = {}
    var v2 : {t2} = {}
    let v3 = v1 {op} v2
}}
'''

limit = 100
negative_type_pairs = list(filter(lambda x: x[0] not in integer_types or x[1] not in integer_types, itertools.product(types, repeat=2)))
random.seed(123)
random.shuffle(negative_type_pairs)
negative_type_pairs = negative_type_pairs[:limit]

counter = 1
for t1, t2 in negative_type_pairs:
    for op in ['<<', '>>']:
        with open(path.format(str(counter).zfill(3)), 'w') as file:
          file.write(template.format('\nclass C{}\n' if 'C' in (t1, t2) else '', default_value(t1), default_value(t2),
                                              op=op, t1=t1, t2=t2))
        counter += 1
