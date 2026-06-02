/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {}

enum A {
    a(Int64)

    public static func b<T>(x: T) where T <: C {
        0
    }
}

main(): Int64 {
    return A.b(1)
}
// ASSERT: scan sema_unable_to_infer_generic_func
