# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os import path

default_value_map = {'Bool' : 'true', 'Unit' : '()', 'Array<Int8>' : '[]', 'Rune' : '\'1\'', 'String' : '"1"'}
def default_value(ty : str) -> str:
  if '(' in ty: return '(1, 1)'
  if 'Int' in ty: return '1'
  if 'Float' in ty: return '1.0'
  return default_value_map[ty]

ordered_types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64', 'Float16', 'Float32', 'Float64', 'String', 'Rune']
types = ordered_types + ['Bool', 'Unit', '(Int8, Int8)', '(Int8, Int16)', 'Array<Int8>']
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
  @Assertion:   4.16(2) All relational operators are binary operators which requires two operands have the same type.
  @Description: Checks that using binary operator {op} with types {t1} and {t2} is not permitted.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

main() {{
    var v1 : {t1} = {}
    var v2 : {t2} = {}
    let v3 = v1 {op} v2
}}
'''
negative_tests = []
positive_template = '''
/*
 * Copyright (c). 2023-2023. All rights reserved.
 */

/*
  @Assertion:   4.16(2) All relational operators are binary operators which requires two operands have the same type.
  @Description: Checks that using the following combinations of binary operators and operand types is permitted.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

from utils import utils.assert.Assert

main() {{
    Assert.isTrue(true == true)
    Assert.isFalse(true != true)
    Assert.isTrue((1, 1) == (1, 1))
    Assert.isFalse((1, 1) != (1, 1))
    Assert.isTrue(() == ())
    Assert.isFalse(() != ())
    Assert.isTrue([1] == [1])
    Assert.isFalse([1] != [1])
{}
    0
}}
'''
positive_template_aux = '    Assert.is{}({}({}) {} {}({}))\n'
positive_replacement = ''
counter = 1

def do(t1 : str, t2 : str, op : str):
  if t1 != t2:
    content = negative_template.format(default_value(t1), default_value(t2), op=op, t1=t1, t2=t2)
    negative_tests.append(content)

for t1 in types:
  for t2 in types:
    if t1 in ordered_types and t2 in ordered_types:
      for op in ['<', '<=', '>=', '>']:
        do(t1, t2, op)
        if t1 == t2:
          has_eq = op in ['==', '<=', '>=']
          positive_replacement += "    Assert.is%s('1' %s '1')\n" % (has_eq, op) if t1 is 'Rune'\
            else positive_template_aux.format(has_eq, t1, default_value(t1), op, t2, default_value(t2))
    for op in ['==', '!=']:
      do(t1, t2, op)
content = positive_template.format(positive_replacement)
with open(path.format(str(counter).zfill(4)), 'w') as file:
  file.write(content)
for test in negative_tests:
  counter += 1
  with open(path.format(str(counter).zfill(4)), 'w') as file:
    file.write(test)
