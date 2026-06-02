/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    operator func [](value!: Int64 = 0): Unit {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_invalid_subscript_assign_parameter_num
// ASSERT: scan sema_cannot_have_default_param
