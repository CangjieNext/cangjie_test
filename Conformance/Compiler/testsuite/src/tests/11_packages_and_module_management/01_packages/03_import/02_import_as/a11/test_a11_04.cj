/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a11_04

  @Level:         1

  @Assertion:    11.1.3.2(11) If import as is decorated with protected, it will be accessed in the current module.

  @Description:  Check that imported content can be accessed in the current module

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

 
*/

package pkga4

main() {
    var name = pName
    return 0
}