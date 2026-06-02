/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a04_01

  @Level:         1

  @Assertion:       8.5(4) 
                    open class A {}

                    extend A {
                        func f() {}
                        func g() {}
                    }

                    class B <: A {
                        func f() {} // error
                        override func g() {} // error
                    }

  @Description:     Negative examples from spec: case 1.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class A {}

extend A {
    func f() {}
    func g() {}
}

class B <: A {
    func f() {} // error
}

main { }
