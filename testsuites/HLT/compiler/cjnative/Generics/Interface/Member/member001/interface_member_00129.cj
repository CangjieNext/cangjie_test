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

interface I<X, Y> {
    static func t(): Int32 {
        1
    }
}

class A <: I<Int32, Int32> {
    public var a: Int32 = t()
}

main() {
    if (A().a != Int32(1)) {
        return 1
    }
    return 0
}
