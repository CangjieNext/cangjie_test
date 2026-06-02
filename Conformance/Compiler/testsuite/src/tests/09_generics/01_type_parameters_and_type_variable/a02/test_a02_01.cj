/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a02_01

  @Level:         1

  @Assertion: 9.1(2) Multiple type parameters are separated using comma , in <>, e.g., <T1, T2, T3>, T1, T2, and T3 
              are all type parameters.

  @Description: Check single type parameter.

  @Mode: compileonly

  @Negative: no

*/

class GenericClass<T> {
}

interface GenericInterface<T> {
    func hello(name: String) {
        return "Hello, ${name}"
    }
}

struct GenericStruct<T> {
    GenericStruct(var x!: T, var y!: T) {}
}

enum GenericEnum<T> {
    | Data(T)
    | Code(Int64)
}

type GenericTypeAlias<T> = GenericClass<T>

func genericFunction<T>(x: T): T {
    return x
}

main() {
}

