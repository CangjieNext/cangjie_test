/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface I<T> {}

interface J<T> {}

class A <: I<Int32> & J<Int32> {
    init() {}
}

main() {
    var a: I<Int64> = A()
    var b: J<Int64> = A()
    return 0
}
// ASSERT: scan sema_mismatched_types
