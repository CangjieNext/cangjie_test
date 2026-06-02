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
path = path.dirname(path.realpath(__file__)) + '/test_a14_{}.cj'
template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   4.15(14) 1. When the type of the left operand is Int64, the type of the right operand can only be
                UInt64, and the expression is of type Int64.
  @Description: Checks that using binary operator ** with types Int64 and {t} is {}.
  @Mode: {}
  @Negative: {}
  @Structure: single
  @CompileWarning: no
*/
{}
main() {{
    let v1 : Int64 = 1
    let v2 : {t} = {}
    let v3 = v1 ** v2{}
}}

'''
positive_substitutes = ['permitted and the result type is\n                Int64', 'run', 'no',
                        '\nfrom utils import utils.assert.Assert\n', '\n    Assert.isTrue(v3 is Int64)']
negative_substitutes = ['not permitted', 'compileonly', 'yes', '', '']
counter = 0
    
for t in types:
  substitutes = negative_substitutes if t is not 'UInt64' else positive_substitutes
  content = template.format(*substitutes[:-1], default_value(t), substitutes[-1], t=t)
  counter += 1
  with open(path.format(str(counter).zfill(2)), 'w') as file:
    file.write(content)
       