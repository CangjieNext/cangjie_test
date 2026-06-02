/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_01_01_a02_11

  @Level:         1

  @Assertion:   11.1.1.1(2) The package name must be a valid identifier.

  @Description: Check that package name cannot start with '9'

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

*/

package 9packagename

main() {
    return 0
}