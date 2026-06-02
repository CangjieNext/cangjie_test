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

open class Foo1 {
    public var dt: Int32 = 2
}

open class Foo2 {
    public var dt: Int32 = 3
}

open class Foo3 {
    public var dt: Int32 = 4
}

class Bar1 <: Foo1 {}

class Bar2 <: Foo2 {}

class Bar3 <: Foo3 {}

enum TimeUnit<T, V, K> where T <: Foo1, V <: Foo2, K <: Foo3 {
    Year(T, V, K)
}

func run(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let bar3: Bar3 = Bar3()
    let time = TimeUnit<Bar1, Bar2, Bar3>.Year(bar1, bar2, bar3)
    var res: Int32 = match (time) {
        case Year(x, y, z) => x.dt + y.dt + z.dt
        case _ => 9
    }
    if (res == 9) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
