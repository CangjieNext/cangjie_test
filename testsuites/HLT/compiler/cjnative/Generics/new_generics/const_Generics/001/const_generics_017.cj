/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    public const func f0(a: Int64): Int64
    public static const func f1(a: (String, Int64)): Int64
}

class C <: I {
    public const func f0(a: Int64): Int64 {
        return 10 * a
    }
    public static const func f1(a: (String, Int64)): Int64 {
        let (_, b) = a
        return b
    }

    const init() {}
}

main() {
    C()
    0
}
