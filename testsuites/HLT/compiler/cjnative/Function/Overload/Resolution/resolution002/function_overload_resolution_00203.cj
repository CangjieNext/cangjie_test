/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {
    static func f(a: Int16): Int64 {
        return 1
    }
}

interface B <: A {
    static func f(a: Int32): Int64 {
        return 2
    }
}

main(): Int64 {
    if (B.f(1) == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_ambiguous_match
