/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a01_03

  @Level:         1

  @Assertion:    11.1.1(1) Package declaration begins with the keyword package, followed 
                 by the package name, must be at the first non-comment, non-blank line of a file. 

  @Description:  Check that keyword package should always be followed by package name

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

package

main() {
    return 0
}