template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:        11_01_01_01_a02_%d

  @Assertion:   11.1.1.1(2) The package name must be a valid identifier.

  @Description: Check package name cannot contain %s

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single
*/

package package%sName

main() {
  return 0  
}

'''
# keywords (without contextual keywords)
symbols = ['`', ']', '\\', '{', '}', '|', ';', ':', "'", '"', ',', '-', '=',
           '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+',  '[',
           '<', '.', '>', '/', '?']

def main():
  '''Generating tests for assert 11.1.1.1(2)'''
  start_generation = 13  # offset so as not to overwrite manual tests
  i = start_generation
  for symbol in symbols:
    with open(f'./test_a02_{i}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (i, symbol, symbol))
      i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()