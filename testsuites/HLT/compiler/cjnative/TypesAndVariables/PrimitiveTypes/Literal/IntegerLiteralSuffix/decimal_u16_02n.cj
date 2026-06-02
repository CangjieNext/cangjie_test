/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var a = 65536u16
    var b = -1u16
    var c = - -1_u16
    var d: UInt16 = - -1
    var e: UInt16 = 1 - (-2)
    return 1
}
// ASSERT: scan sema_exceed_num_value_range
// ASSERT: scan sema_mismatched_types
