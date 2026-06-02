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

open class Foo {
    public var dt: Int32 = 2
}

class Bar <: Foo {}

enum TimeUnit<T> where T <: Foo {
    Year(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    let time = TimeUnit<Bar>.Year(bar)
    var res: Int32 = match (time) {
        case Year(bar) => bar.dt
    }
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
