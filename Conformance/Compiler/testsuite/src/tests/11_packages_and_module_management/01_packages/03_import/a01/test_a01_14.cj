/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a01_14

  @Level:         1

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
  
  @Description:  Check that the renamed identifier cannot start with 1

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: dir1/aux_test_a01_01.cj

  @Module:       mod113a01
*/
import mod113a01.dir1.AuxTestA0101 as 1class1

main() {
    return 0
}

