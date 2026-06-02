/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var cfunc: CFunc<(CPointer<Int32>) -> CPointer<Int32>> = {
    a =>
    var b: CPointer<Int32> = CPointer<Int32>(a)
    unsafe { b.write(0, 49) } // ascii: '1' => 49
    return b
}
var lambda: (CPointer<Int32>) -> CPointer<Int32> = {
    a =>
    var b: CPointer<Int32> = CPointer<Int32>(a)
    unsafe { b.write(0, 49) } // ascii: '1' => 49
    return b
}

unsafe main(): Int64 {
    lambda = cfunc
    cfunc = lambda
    return 0
}
// ASSERT: scan sema_mismatched_types
