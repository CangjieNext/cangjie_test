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
    let a = Array<Int32>..Array<Int32> : Array<Int32>
    return 1
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_ref_not_be_type
// ASSERT: scan sema_mismatched_types
