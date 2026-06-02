/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle 2>&1 |compare %f

import pkgs.*

main(): Int64 {
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_use_this_as_an_expression_in_func
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_illegal_usage_of_member
