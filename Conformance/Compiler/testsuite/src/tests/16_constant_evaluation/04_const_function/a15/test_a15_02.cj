
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a15_02

  @Level:         1

  @Assertion:   16.4(15)
                const func f(a: Int64): Int64 { // ok
                    let b = 6
                    if (a > 5 && (b + a) < 15) {
                        return a * a
                    }
                    return a
                }

                class A {
                    var a = 0
                }

                const func f1(a: A): Unit { // ok
                    return
                }

                const func f2(): A {
                    return A() // error, A did not contains const init
                }
  @Description: Checks the negative case of the given example.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614
*/

const func f(a: Int64): Int64 { // ok
    let b = 6
    if (a > 5 && (b + a) < 15) {
        return a * a
    }
    return a
}

class A {
    var a = 0
}

const func f1(a: A): Unit { // ok
    return
}

const func f2(): A {
    return A() // error, A did not contains const init
}

main() { }
