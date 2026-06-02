/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a10_02

  @Level:         1

  @Assertion:   8.2.1.1(10) Function definitions within extensions do not support
                the open, override, redef modifiers.

  @Description: Checks that extension function doesn't support override modifier.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

class A {
    open func foo1() {}
}

extend A {
    override func foo1() {}
}

main() {
    return 0
}
