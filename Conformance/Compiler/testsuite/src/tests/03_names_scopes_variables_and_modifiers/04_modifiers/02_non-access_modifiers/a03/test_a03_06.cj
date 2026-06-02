/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_06

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that overriden functions should keep the same named formal parameters.

  @Mode:         compileonly

  @Negative:     yes
*/

open class C1 {
    public open func foo(a!: Int32) {
        return a + 1
    }
}

class C2 <: C1 {
    override public func foo(b!: Int32) {
        return a + 1
    }
}

main() {
    return 0
}
