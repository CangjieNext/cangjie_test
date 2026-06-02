/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

foreign func testfunc1(): CPointer<Float32>

foreign func testfunc2(): CPointer<CPointer<Float64>>

unsafe main(): Int64 {
    var count = 0
    var ptr1: CPointer<CPointer<Float32>> = testfunc1()
    var ptr2: CPointer<CPointer<Int32>> = testfunc1()
    var ptr3: CPointer<Float64> = testfunc2()
    var ptr4: CPointer<Int32> = testfunc2()

    return 0
}
// ASSERT: scan sema_mismatched_types
