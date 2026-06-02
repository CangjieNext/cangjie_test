/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var num1: Int64 = 2
    var res1 = "hello world".get(num1)
    var res2: Int32 = "hello world".lastIndexOf(UInt8(UInt32(r'e')))
    var res3: Int32 = "hello world".indexOf(UInt8(UInt32(r'e')))

    return 0
}
// ASSERT: scan sema_mismatched_types
