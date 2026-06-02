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

struct A<T> {
    public static func test(): Int64 {
        1
    }
    public static let i: Int64 = 1
    public operator func *(input_b: A<T>): Bool {
        var a = i
        var b = test()
        return true
    }
}

main(): Int64 {
    return 0
}
