
template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name: 06_02_01_01_a01_%02d

  @Assertion: Interfaces are declared with the interface keyword.

  @Description: Check that the '%s' keyword can not define an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/


%s A {
    func f(): Unit
}

main() {
}
'''
# keywords
keywords = ['as', 'break', 'Bool',
            'case', 'catch',
            'continue', 'Rune', 'do',
            'else', 'enum', 'extend',
            'false', 'finally', 'for',
            'foreign', 'from', 'func',
            'Float16', 'Float32', 'Float64',
            'if', 'import', 'in',
            'init', 'is',
            'Int8', 'Int16', 'Int32',
            'Int64', 'IntNative', 'let',
            'macro', 'match', 'mut',
            'main', 'Nothing', 'operator',
            'package', 'prop', 'quote',
            'return', 'spawn',
            'static', 'super', 'synchronized',
            'this', 'throw', 'true',
            'try', 'type', 'This',
            'unsafe', 'UInt8', 'UInt16',
            'UInt32', 'UInt64', 'UIntNative',
            'Unit', 'var', 'where',
            'while', 'abstract', 'open', 'override',
            'private', 'protected', 'public',
            'redef', 'get', 'set', 'sealed', 'inout']

def main():
  '''Generating tests for assert 6.2.1.1.1'''
  start_generation = 2  # offset so as not to overwrite manual tests
  i = start_generation
  for key in keywords:
    with open(f'./test_a01_{i:02d}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (i, key, key))
      i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()