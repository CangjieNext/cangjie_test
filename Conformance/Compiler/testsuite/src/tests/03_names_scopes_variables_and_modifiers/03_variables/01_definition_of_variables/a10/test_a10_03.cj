/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a10_03

  @Level:         1

  @Assertion:    3.3.1(10) At the semantic check stage, it is checked whether the pattern is actually irrefutable, 
                 if not, it is a compile-time error.

  @Description:  Check that variables defined with refutable tuple pattern produce compile-time error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    var (1, x) = (12, 3.14)
}