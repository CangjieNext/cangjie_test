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

struct Data<T> {
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

func f1<T>(x: T): T {
    return x
}

struct Test {
    public var f2: (Data<Int32>) -> Data<Int32> = f1<Data<Int32>>
    public init() {}
}

func run(): Int64 {
    var i: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i)
    var data2: Data<Int32> = Test().f2(data)
    let res: Int32 = data2.dt
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
