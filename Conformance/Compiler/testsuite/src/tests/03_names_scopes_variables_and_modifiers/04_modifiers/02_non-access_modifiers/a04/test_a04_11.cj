/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a04_11

  @Level:         1

  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  Check that redefined function should keep the same named formal parameters.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

open class C1 {
    static func foo(a!: Int64) {
        return "foo"
    }
}

class C2 <: C1 {
    redef static func foo(b!: Int64) {
        return "redefined foo"
    }
}

main() {
    return 0
}
