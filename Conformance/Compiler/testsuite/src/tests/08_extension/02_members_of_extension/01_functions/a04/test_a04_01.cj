/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_a04_01

  @Level:         1

  @Assertion:   8.2.1(4)
                interface I {}
                extend Int64 {
                    func f<T>(a: T, b!: Int64 = 0) where T <: I {}
                    func f(a: String, b: String) {}
                }

  @Description: Checks the given example.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

interface I {}

extend Int64 {
    func f<T>(a: T, b!: Int64 = 0) where T <: I {}
    func f(a: String, b: String) {}
}

class C <: I { }

main() {
    1.f<C>(C())
    2.f<I>(C())
    3.f<C>(C(), b: 4)
    5.f<I>(C(), b: 6)
    7.f("a", "b")
}
