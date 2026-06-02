/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_08

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that overriden functions should keep the same parameters type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

interface I {
    func foo(p: String) {
        return "Hello ${p}"
    }
}

class C1 <: I {
    override public func foo(p: Int64) {
        return "Bye ${p}"
    }
}

main() {
    return 0
}
