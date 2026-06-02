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

open class Foo1<T> {
    public var dt1: Int32 = 1
}

open class Foo2<T> {
    public var dt1: Int32 = 2
}

class Bar1 <: Foo1<Int32> {
    public var dt: Int32 = 3
}

class Bar2 <: Foo2<Int32> {
    public var dt: Int32 = 4
}

struct Data<T1, T2> where T1 <: Foo1<Int32>, T2 <: Foo2<Int32> {
    public let classBar1: T1
    public let classBar2: T2
    public Data(x: T1, y: T2) {
        classBar1 = x
        classBar2 = y
    }
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let data: Data<Bar1, Bar2> = Data<Bar1, Bar2>(bar1, bar2)
    var classBar1: Bar1 = data.classBar1
    var classBar2: Bar2 = data.classBar2
    var res1: Int32 = classBar1.dt
    var res2: Int32 = classBar2.dt
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
