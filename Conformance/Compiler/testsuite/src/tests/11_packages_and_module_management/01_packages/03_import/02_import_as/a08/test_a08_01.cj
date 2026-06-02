/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a08_01

  @Level:         1

  @Assertion:    11.1.3.2(8) After renaming the imported declaration by using import as,
                 the current package can only use the renamed name.  
 
  @Description:  Check that after renaming the imported declaration by using import as,
                 the current package can only use the renamed name. 

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a08_01.cj
 
*/

import p1.foo as f 

main() {
    f()
    foo()
    return 0
}