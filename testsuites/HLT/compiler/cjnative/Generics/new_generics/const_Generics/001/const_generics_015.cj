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

interface I {
    public const func f0(a: Int64): Int64
    public static const func f1(a: (String, Int64)): Int64
}

class C <: I {
    public const func f0(a: Int64): Int64 {
        return 10 * a
    }
    public static const func f1(a: (String, Int64)): Int64 {
        return 1
    }

    const init() {}
}

const func ff<T>(a: T) where T <: C {
    return a.f0(3) + T.f1(("", 2))
}

main() {
    if (ff<C>(C()) == 31) {
        return 0
    }
    return 1
}
