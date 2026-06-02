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

class Data {
    public var a: Int32 = 1
    public var b: Float32 = 2.0
}

func run(): Int64 {
    var value1: Data = Data()
    if (value1.a != 1) {
        return 1
    }
    if (value1.b != 2.0) {
        return 2
    }
    return 0
}

main(): Int64 {
    return run()
}
