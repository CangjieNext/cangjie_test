
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a15_02

  @Level:         1

  @Assertion:   6.1.2.2(15)
                class Foo <: Bar {
                    static let y: Int64

                    static init() { // called first
                        y = x // error: not yet initialized variable
                    }
                }
                open class Bar {
                    static let x: Int64

                    static init() { // called second
                        x = 2
                    }
                }
  @Description: Checks that assigning y inside the Foo static initializer is not allowed.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

class Foo <: Bar {
    static let y: Int64

    static init() { // called first
        y = x // error: not yet initialized variable
    }
}
open class Bar {
    static let x: Int64

    static init() { // called second
        x = 2
    }
}

main() { }
