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
    public static let a: Int32 = 2
    // init {}
    public var b: Int32
    public init() {
        b = a + 1
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (Data.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
