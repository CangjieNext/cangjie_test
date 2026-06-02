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
    public static let i: Int32 = 0
    public Data(let a!: Int32 = Data.i) {
    }
}

func run(): Int32 {
    var data: Data = Data()
    var data2: Data = Data(a: 5)

    if (data.a == 0 && data2.a == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int64(run())
}
