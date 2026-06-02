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
path = path.dirname(path.realpath(__file__)) + '/test_a13_{}.cj'
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.15(13) The left operand of ** can only be of type Int64 or Float64.
  @Description: Checks that using binary operator ** with types {t1} and {t2} is {}permitted.
  @Mode: compileonly
  @Negative: {}
  @Structure: single
  @CompileWarning: no
*/

main() {{
    let v1 : {t1} = {}
    let v2 : {t2} = {}
    let v3 = v1 ** v2
}}

'''

counter = 0
    
for t1 in types:
  for t2 in types:
    negative = not ((t1 is 'Float64' and t2 in ['Int64', 'Float64']) or (t1 is 'Int64' and t2 is 'UInt64'))
    content = template.format('not ' if negative else '', 'yes' if negative else 'no', default_value(t1), default_value(t2), t1=t1, t2=t2)
    counter += 1
    with open(path.format(str(counter).zfill(3)), 'w') as file:
      file.write(content)
       