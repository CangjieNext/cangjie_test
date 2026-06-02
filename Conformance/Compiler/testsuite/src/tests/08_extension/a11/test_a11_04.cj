/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a11_04

  @Level:         1

  @Assertion:   8(11) Extensions cannot add abstract members.

  @Description: Checks that extensions of standard type cannot add abstract members.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

extend Int64 {
    func foo(): Int64
}

main() {
}
