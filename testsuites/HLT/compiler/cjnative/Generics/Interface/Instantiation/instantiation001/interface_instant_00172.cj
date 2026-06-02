/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface A<X, Y> {}

class B<X, Y, Z> <: A<X, Y> {}

class C <: A<Int32, Int32> {}

main() {
    var i: A<Int32, Int32> = B<Int64, Int64, Int64>()
    var j: A<Int64, Int64> = C()
    return 0
}
// ASSERT: scan sema_mismatched_types
