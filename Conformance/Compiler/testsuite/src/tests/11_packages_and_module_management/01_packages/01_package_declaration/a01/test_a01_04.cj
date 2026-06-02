/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a01_04

  @Level:         1

  @Assertion:    11.1.1(1) Package declaration begins with the keyword package, followed 
                 by the package name, must be at the first non-comment, non-blank line of a file. 

  @Description:  Check that Package declaration must be at the first non-comment, non-blank line 
                 of a file. 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

var a = 0

package package11

main() {
    return 0
}