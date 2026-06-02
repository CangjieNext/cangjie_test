/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a01_02

  @Level:         1

  @Assertion:   8(1) Extensions can add new functionality to any type visible in the current
                package, except for functions, tuples, and interfaces.

  @Description: Checks that extending of function type is not allowed.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

extend () -> Int64 {
}

main() {
}
