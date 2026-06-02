/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Foo1 {
    public var dt: Int32 = 2
}

class Bar1 <: Foo1 {}

struct Data<T, V> where T <: Foo1 {
    public let classBar1: T
    public let i: V
    public Data(x: T, y: V) {
        classBar1 = x
        i = y
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let i: Int32 = 2
    let data: Data<Bar1, Int32> = Data<Bar1, Int32>(bar1, i)
    var res1: Int32 = data.classBar1.dt
    var res2: Int32 = data.i
    if (res1 == 2 && res2 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
