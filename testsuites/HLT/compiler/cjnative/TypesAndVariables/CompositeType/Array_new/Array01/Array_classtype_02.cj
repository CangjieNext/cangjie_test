/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {
    A(var ra!: Int64 = 0, let rb!: Int64 = 0) {
    }
}

class B <: A {
    B(var rc!: Int64 = 0, let rd!: Int64 = 0) {
    }
}

var a1: Array<B> = [B(rc: 0, rd: 0), A(ra: 1, rb: 1)]

main(): Int64 {
    return 0
}
// ASSERT: scan sema_mismatched_types
