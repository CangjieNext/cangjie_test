/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

import std.collection.*

var a = HashMap<Int64, String>(1, "5")

main(): Int64 {
    let b = HashMap<Int64, String>()
    return 0
}
// ASSERT: scan sema_parameters_and_arguments_mismatch
// ASSERT: scan sema_mismatched_types
