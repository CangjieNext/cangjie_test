/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

struct Data {
    public var b: Int32
    public Data() {
        this.b = 3
    }
    public init(input: Int32) {
        Data()
        this.b = input
    }
}

func run(): Int32 {
    var a: Int32 = 5
    var data: Data = Data(a)
    return data.b - 5
}

main(): Int64 {
    return Int64(run())
}
