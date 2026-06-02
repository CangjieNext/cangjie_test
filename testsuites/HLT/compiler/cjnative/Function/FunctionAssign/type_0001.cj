/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

struct R<T> {
    public func funca(a: Int32, b: T): Int32 {
        return a
    }

    public func funcb(a: Int32): Unit {
    }
}

let a: (Int32) -> Int32 = R<Bool>().funcb

main(): Int64 {
    let b: (Int32, Int32) -> Int32 = R<Bool>().funca
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_no_match_function_declaration_for_ref
