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

struct Data1 {
    public var width: Int32 = 3
    public init(width!: Int32 = 3) {
        this.width = width
    }
}

struct Data2<T> {
    public let rec: T
    public Data2(x: T) {
        rec = x
    }
}

func run(): Int64 {
    let data1: Data1 = Data1()
    let data: Data2<Data1> = Data2<Data1>(data1)
    var res: Data1 = data.rec
    if (res.width == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
