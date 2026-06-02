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
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

class Data<T1> where T1 <: Foo<Int32> {
    public var classFoo: T1
    public init(x: T1) {
        classFoo = x
    }
}

func run(): Int64 {
    var dt: Int32 = 3
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo<Int32> = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
