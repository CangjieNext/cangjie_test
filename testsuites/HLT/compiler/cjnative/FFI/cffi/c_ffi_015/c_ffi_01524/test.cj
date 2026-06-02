/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// ERRCHECK: %compiler %cmp_opt %ffic_opt -o %output

foreign func test(ptr: CPointer<Unit>): Int64

main(): Int64 {
    var a = ()
    unsafe {
        return test(inout a)
    }
}
// ASSERT: scan sema_inout_modify_cstring_or_zerosized
