/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_a04_01

  @Level:         1

  @Assertion: 9(4) Class, interface, struct, enum, typealias with generic parameters are generic type.

  @Description: Checks generic types declaration.

  @Mode: compileonly

  @Negative: no

*/

class GenericClass<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

interface GenericInterface {
    func hello(name: String) {
        return "Hello, ${name}"
    }
}

struct GenericStruct<T> {
    init (arg1: T, arg2: T) {
        x = arg1
        y = arg2
    }

    var x: T
    var y: T
}

enum GenericEnum<T> {
    | Data(T)
    | Code(Int64)
}

type GenericTypeAlias<T> = GenericClass<T>

main() {
}

