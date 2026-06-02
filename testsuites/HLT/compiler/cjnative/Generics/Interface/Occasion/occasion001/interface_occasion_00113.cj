/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<T> {
    static func foo<X>(a: X): X {
        return a
    }
}

main() {
    I.foo<Int32>(Int32(1))
    return 0
}
// ASSERT: scan sema_unable_to_infer_generic_func
