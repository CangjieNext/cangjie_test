# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.


template = '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:    11.2(3) The declaration or definition that are not modified by public 
                 can be accessed within the current package. And the internal is the default
                 accessibility. 
 
  @Description:  Check that internal is the default accessibility for %s

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a03_03.cj
 
*/

package pkg3
import pkga3.a%i

main() {
    return 0
}
'''
# keywords (without contextual keywords)
keywords = ['Int8', 'Int16', 'Int32', 'Int64', 'IntNative', 'UInt16', 'UInt32',
            'UInt64', 'UIntNative', 'Float16', 'Float32', 'Float64', 'Rune',
            'String', 'Range', 'Array', 'Bool', 'func', 'struct', 'enum', 'class'] 

def main():
  '''Generating tests for assert 11.2(3)'''
  start_generation = 2  # offset so as not to overwrite manual tests
  i = start_generation
  for key in keywords:
    with open(f'./test_a03_{i}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (key, i-1))
      i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()