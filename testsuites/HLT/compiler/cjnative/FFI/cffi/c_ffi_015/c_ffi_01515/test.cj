/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// ERRCHECK: %compiler %cmp_opt %ffic_opt -o %output

foreign func test(ptr: CPointer<Int64>): Unit

main(): Int64 {
    var a = 1
    unsafe {
        test(inout a >> 1)
    }
    return 0
}
// ASSERT: scan sema_inout_must_be_var_variable
