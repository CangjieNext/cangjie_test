/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend String {
    operator func [](arg1: String, value!: String): Unit {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_immutable_type_extend_assignment_index_operator
