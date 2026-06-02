template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:         11_01_03_a01_%d

  @Assertion:    11.1.3(1) The syntax of import is as follows.
       importList 
           :    ('from' identifier)? 'import' importAllOrSpecified (',' importAllOrSpecified)* 
           ; 

       importAllOrSpecified 
           : importAll importAllAlias? 
            | importSpecified importAlias? 
           ; 

       importSpecified 
           : (identifier '.')+ identifier 
           ; 

       importAll 
           : (identifier '.')+ '*' 
           ; 

       importAllAlias 
          : 'as' identifier '.' '*' 
          ; 

       importAlias 
           : 'as' identifier 
           ; 
  
  @Description:  Check that the renamed identifier cannot start with %s

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: dir1/aux_test_a01_01.cj

  @Module:       mod113a01
*/
from mod113a01 import dir1.AuxTestA0101 as %sclass1

main() {
    return 0
}

'''
# keywords (without contextual keywords)
symbols = ['`', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ']', '\\', 
           '{', '}', '|', ';', ':', "'", '"', ',', '-', '=', '~', '!', '@', 
           '#', '$', '%', '^', '&', '*', '(', ')', '+',  '[', '<', '.', '>', 
           '/', '?']

def main():
  '''Generating tests for assert 11.1.3.(1)'''
  start_generation = 12  # offset so as not to overwrite manual tests
  i = start_generation
  for symbol in symbols:
    with open(f'./test_a01_{i}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (i, symbol, symbol))
      i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()