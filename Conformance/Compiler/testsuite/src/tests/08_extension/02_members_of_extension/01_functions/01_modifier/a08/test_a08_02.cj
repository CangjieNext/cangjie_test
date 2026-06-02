/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a08_02

  @Level:         1

  @Assertion:   8.2.1.1(8) An extension to the struct type can define the mut function.

  @Description: Checks that non-mut struct functions cannot change fields.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

struct S {
    var value = 7
}

extend S {
    func foo1(): Int64 {
        value++
        value
    }
    public func foo2(): Int64 {
        value--
        value
    }
}

main() {
    return 0
}
