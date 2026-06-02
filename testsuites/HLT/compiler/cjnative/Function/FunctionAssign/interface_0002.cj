/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

interface R<T> {
    static func funca(a: Int32, b: T): Int32 {
        return a
    }
}

class C<T> <: R<T> {}

let a = C.funca
var b = C.funca

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_type_without_type_argument
