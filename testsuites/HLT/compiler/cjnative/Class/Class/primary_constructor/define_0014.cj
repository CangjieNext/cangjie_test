/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

class Data<T> {
    public var p0: T
    public let p1: Int32
    public Data(x: Int32, p0: T, p1!: Int32 = 0) {
        this.p0 = p0
        this.p1 = p1
    }
}

func run(): Int32 {
    let a: Int32 = 5
    var data: Data<Int32> = Data<Int32>(a, a)
    return data.p0 - 5 + data.p1
}

main(): Int64 {
    return Int64(run())
}
