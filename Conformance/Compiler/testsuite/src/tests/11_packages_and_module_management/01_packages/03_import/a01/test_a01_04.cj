/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a01_04

  @Level:         1

  @Assertion:    11.1.3(1)
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
  
  @Description:  

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: dir1/aux_test_a01_01.cj dir1/dir2/aux_test_a01_02.cj

  @Module:       mod113a01
*/

import default.dir1.*
import default.dir1.dir2.*

main() {
    AuxTestA0101.fileName()
    AuxTestA0102.fileName()
    return 0
}
