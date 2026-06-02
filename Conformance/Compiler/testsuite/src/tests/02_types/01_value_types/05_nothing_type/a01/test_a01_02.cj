/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_05_a01_02

  @Level:         1

  @Assertion: 2.1.5(1)
              The Nothing type is a special type that does not contain any value, and it is the subtype of all types.
              The Nothing type usually implies dead code.

  @Description: Check example where expression of Nothing type implies dead code.

  @Mode: run

  @Negative: no

  @CompileWarning: no

*/

main() {
    return 0

    var x = 5
    var y = 3
    x + y
}

