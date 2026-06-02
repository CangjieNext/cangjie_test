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

struct Data1<T> {
    public let width: T
    public init(x: T) {
        width = x
    }
}

struct Data2<T> {
    public let rec: T
    public init(x: T) {
        rec = x
    }
}

func run(): Int64 {
    let data1: Data1<Int32> = Data1<Int32>(4)
    let data: Data2<Data1<Int32>> = Data2<Data1<Int32>>(data1)
    var res = data.rec
    if (res.width == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
