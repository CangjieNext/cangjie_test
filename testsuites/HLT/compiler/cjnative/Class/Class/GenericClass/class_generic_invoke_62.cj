/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Foo<T> {
    public var a: T
    public init(a1: T) {
        a = a1
    }
}

class Data<T> {
    public let classFoo: T
    public init(x: T) {
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo<Int32> = data.classFoo
    var res = classFoo.a
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
