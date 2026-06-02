/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_mismatched_types

interface I {}

extend Int64 <: I {}

main() {
    var a: (I) -> Int64 = {_: I => 1}
    var b: (Int64) -> I = a
    return 0
}
