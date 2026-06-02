// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func f16(): Float16 {
    let a: Float16 = 3.5
    let b: Float16 = 1.0
    return a - b
}

main(): Int64 {
    let a: Float32 = Float32(f16())
    if (a == 2.500) {
        return 0
    }
    return 1
}
