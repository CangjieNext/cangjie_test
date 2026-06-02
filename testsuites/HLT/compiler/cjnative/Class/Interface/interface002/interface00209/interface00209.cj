/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: interface00209a
// EXEC: %compiler %cmp_opt %compile_lib_opt interface00209a/interface00209a.cj -o interface00209a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %n.%middle 2>&1 | compare %f

import interface00209a.*

interface A <: interface00209a.MyInterface {}

class B <: A {}

main(): Int64 {
    var a = B()
    return 0
}
// ASSERT: scan sema_interface_inherit_non_interface
// ASSERT: scan sema_undeclared_type_name
