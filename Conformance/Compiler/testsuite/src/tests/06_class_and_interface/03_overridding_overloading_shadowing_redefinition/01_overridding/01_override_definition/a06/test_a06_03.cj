/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a06_03

  @Level:         1

  @Assertion: 6.3.1.1(6) The generic type parameters of the function must be the same as the overridden function.

  @Description: Check different number of the generic type parameters and different generic type parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A<T1, T2> {}

interface I {
    func f<T1, T2>(): A<T1, T2>
}

class C <: I {
    public func f<K1, K2>(): A<K2, K1> {
        A<K2, K1>()
    }
}

main() {
}
