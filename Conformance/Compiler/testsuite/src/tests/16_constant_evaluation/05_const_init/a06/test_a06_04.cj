
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a06_04

  @Level:         1

  @Assertion:   16.5(6)
                struct R1 {
                    var a: Int64
                    let b: Int64

                    const init() { // ok
                        a = 0
                        b = 0
                    }
                }

                struct R2 {
                    var a = 0
                    let b = 0

                    const init() {} // ok
                }

                func zero(): Int64 {
                    return 0
                }

                struct R3 {
                    let a = zero()

                    const init() {} // error Initialization of a is not const expression
                }

                class C1 {
                    var a = 0

                    const init() {} // error a can not be var binding
                }

                struct R4 {
                    var a = C1()

                    const init() {} // error Initialization of a is not const expression
                }

                open class C2 {
                    let a = 0
                    let b = R2()

                    const init() {} // ok
                }

                class C3 <: C2 {
                    let c = 0

                    const init() {} // ok
                }
  @Description: Check that const init is not allowed in R4 in the given example.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct R1 {
    var a: Int64
    let b: Int64

    const init() { // ok
        a = 0
        b = 0
    }
}

struct R2 {
    var a = 0
    let b = 0

    const init() {} // ok
}

func zero(): Int64 {
    return 0
}

class C1 {
    var a = 0

    init() {} // error a can not be var binding
}

struct R4 {
    var a = C1()

    const init() {} // error Initialization of a is not const expression
}

open class C2 {
    let a = 0
    let b = R2()

    const init() {} // ok
}

class C3 <: C2 {
    let c = 0

    const init() {} // ok
}

main() { }
