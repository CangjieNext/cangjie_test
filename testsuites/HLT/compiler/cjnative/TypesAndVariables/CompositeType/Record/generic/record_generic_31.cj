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

open class Foo {
    public var dt: Int32 = 2
}

class Bar <: Foo {}

struct Data<T1> where T1 <: Foo {
    public let classBar: T1
    public init(x: T1) {
        classBar = x
    }
}

func run(): Int64 {
    let bar: Bar = Bar()
    let data: Data<Bar> = Data<Bar>(bar)
    var classBar: Bar = data.classBar
    var res: Int32 = classBar.dt
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
