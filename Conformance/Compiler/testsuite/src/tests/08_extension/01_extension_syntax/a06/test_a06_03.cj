/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a06_03

  @Level:         1

  @Assertion:   8.1(6) Extension can only be defined at the top level.

  @Description: Checks that extension defined in interface is not allowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

interface I {
    extend String {
        func foo(): Int64 { 0 }
    }
}


main() {
}


