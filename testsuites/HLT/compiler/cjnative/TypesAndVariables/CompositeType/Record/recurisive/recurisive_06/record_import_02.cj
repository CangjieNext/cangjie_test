/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs/pkgs.%middle 2>&1 | compare %f

import pkgs.*

main(): Int64 {
    return 0
}
// ASSERT: scan sema_value_type_recursive
// ASSERT: scan sema_class_uninitialized_field
