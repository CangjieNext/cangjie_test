# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os import path
import random

integer_types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64']
other_types = ['Float16', 'Float32', 'Float64', 'String', 'Rune', 'Bool', 'Unit', '(Int8, Int8)', 'Array<Int8>', 'C']
types = integer_types + other_types
default_value_map = {'Bool' : 'true', 'Unit' : '()', 'Array<Int8>' : '[]', 'Rune' : "'1'", 'String' : '"1"', '(Int8, Int8)' : '(1, 1)', 'C' : 'C()'}
def default_value(ty : str) -> str:
  if ty in integer_types: return '1'
  if 'Float' in ty: return '1.0'
  return default_value_map[ty]

dir = path.dirname(path.realpath(__file__))
path = dir + '/test_' + path.basename(dir) + '_{}.cj'
negative_template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.18(2) Bitwise operators can only be applied to operands of integer types.
  @Description: Checks that using bitwise operator {op} with types {t1} and {t2} is not permitted.
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
class_decl = '\nclass C {}\n'
negative_tests = []
negative_tests_limited = []
positive_template = '''
/*
 * Copyright (c). 2023-2023. All rights reserved.
 */

/*
  @Assertion:   4.18(2) Bitwise operators can only be applied to operands of integer types.
  @Description: Checks that using the following combinations of bitwise operators and operand types is permitted.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

from utils import utils.assert.Assert

main() {{
    
{}
    0
}}
'''
positive_template_aux = '    Assert.equals({}, {}({}) {} {}({}))\n'
positive_replacement = ''
inversion_template = '''
/*
 * Copyright (c). 2023-2023. All rights reserved.
 */

/*
  @Assertion:   4.18(2) Bitwise operators can only be applied to operands of integer types.
  @Description: Checks that using operator ! with type {t} is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/
{}
main() {{
    var v : {t} = {}
    !v
}}
'''
calc_map = {'|' : 1, '&' : 1, '^' : 0, '<<' : 2, '>>' : 0}

for t1 in types:
  for t2 in types:
    for op in ['&', '^', '|', '<<', '>>']:
      if t1 in integer_types and (t1 == t2 or (op in ['<<', '>>'] and t2 in integer_types)):
        positive_replacement += positive_template_aux.format(calc_map[op], t1, default_value(t1), op, t2, default_value(t2))
      else:
        target_list = negative_tests if t1 in integer_types and t2 in integer_types else negative_tests_limited
        target_list.append(negative_template.format(class_decl if 'C' in (t1, t2) else '', default_value(t1), default_value(t2),
                                                    op=op, t1=t1, t2=t2))

counter = 1
content = positive_template.format(positive_replacement)
with open(path.format(str(counter).zfill(3)), 'w') as file:
  file.write(content)

limit = 100
random.seed(123)
random.shuffle(negative_tests_limited)
negative_tests += [inversion_template.format(class_decl if 'C' == t else '', default_value(t), t=t) for t in other_types]
for test in negative_tests + negative_tests_limited[:limit]:
  counter += 1
  with open(path.format(str(counter).zfill(3)), 'w') as file:
    file.write(test)
