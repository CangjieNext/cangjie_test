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

class Data {
    public static let a: Int32 = 1
    public static func foo(): Int32 {
        return Data.a
    }
}

func run(): Int64 {
    if (Data.foo() != 1 || Data.a != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
