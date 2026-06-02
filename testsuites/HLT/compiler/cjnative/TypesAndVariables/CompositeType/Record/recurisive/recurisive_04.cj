/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

struct R {
    var a: R2
}

struct R2 {
    var a: R
    var a2: R3
}

struct R3 {
    var a: R2
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_value_type_recursive
// ASSERT: scan sema_class_uninitialized_field
