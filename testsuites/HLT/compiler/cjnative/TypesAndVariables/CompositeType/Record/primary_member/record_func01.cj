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

struct Test {
    public var width: Int32 = 2
    public var length: Int32 = 5
    public func area(): Int32 {
        return width * length
    }
    public init() {}
}

let test = Test().area()

func run(): Int64 {
    if (test == 10) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
