/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle

import pkgs.*

main(): Int64 {
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_illegal_usage_of_member
// ASSERT: scan sema_illegal_member_used_in_open_constructor
// ASSERT: scan sema_member_variable_can_not_shadow
