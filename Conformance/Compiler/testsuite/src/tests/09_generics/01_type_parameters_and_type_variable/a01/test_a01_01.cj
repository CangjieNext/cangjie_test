/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a01_01

  @Level:         1

  @Assertion: 9.1(1) In Cangjie programming language, type parameters are represented by identifiers enclosed in <>.

  @Description: Check correct type parameter enclosed in <>.

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

