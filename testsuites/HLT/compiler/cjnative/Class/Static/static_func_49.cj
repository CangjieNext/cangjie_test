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

struct Data {
    public static let b: Int32 = 2
    public static func coo(x: Int32): Int32 {
        return x + b
    }
}

func run(): Int64 {
    if (Data.coo(2) != 4) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
