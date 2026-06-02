/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a03_01

  @Level:         1

  @Assertion:   8.2.1(3) None of these functions can be abstract functions.

  @Description: Checks that abstract class direct extension function member cannot be abstract.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

abstract class A {}

extend A {
    public func foo(): Int64
}

main() {
}
