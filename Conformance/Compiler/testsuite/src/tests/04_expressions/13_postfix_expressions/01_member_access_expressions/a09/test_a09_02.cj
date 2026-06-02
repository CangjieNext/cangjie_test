/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a09_02

  @Level:         1

  @Assertion: 4.13.1(9) T is super: within a class or interface scope, non-static members of the direct superclass
              of the current class can be accessed by the super keyword.

  @Description: Check that access to static data members of direct superclass using 'super' keyword causes a
                compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class C1 {
    static var x: Int64 = 1
}

class C2 <: C1 {
    func test() {
        let t = super.x
        return t
    }
}

main() {}

