# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os import path

def default_value(ty : str) -> str:
  if 'Int' in ty: return '1'
  if 'Float' in ty: return '1.0'
  raise

types = ['Int8', 'Int16', 'Int32', 'Int64', 'UInt8', 'UInt16', 'UInt32', 'UInt64', 'Float16', 'Float32', 'Float64']
operators = ['*', '/', '%', '+', '-']
path = path.dirname(path.realpath(__file__)) + '/test_a07_{}.cj'
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.15(7) For binary operators *, /, %, + and -, the types of operands supported by them are all numeric
                types, except %, which only supports integer types.
  @Description: Checks that using binary operator {op} with types {t1} and {t2} is {}permitted.
  @Mode: {}
  @Negative: {}
  @Structure: single
  @CompileWarning: no
*/

main() {{
    var v1 : {t1} = {}
    var v2 : {t2} = {}
    let v3 = v1 {op} v2
}}

'''

counter = 0
negative_substitutes = ['not ', 'compileonly', 'yes']
positive_substitutes = ['', 'run', 'no']
    
for op in operators:
  for t1 in types:
    for t2 in types:
      negative = t1 != t2
      negative |= op is '%' and ('Float' in t1 or 'Float' in t2)
      substitutes = negative_substitutes if negative else positive_substitutes
      content = template.format(*substitutes, default_value(t1), default_value(t2), op=op, t1=t1, t2=t2)
      counter += 1
      with open(path.format(str(counter).zfill(3)), 'w') as file:
        file.write(content)
       