// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f

interface I1 {}

extend Int64 <: I1 {}

main(): Int64 {
    let a: Array<I1> = [1, 2, 3].toArray()
    let b: Array<Int64> = [1, 2, 3]
    let c: Array<I1> = b
    return 0
}
// ASSERT: scan sema_mismatched_types
