/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend Float16 {
    operator func [](arg1: Float16, value!: Float16): Unit {
    }
}

extend Float32 {
    operator func [](arg1: Float32, value!: Float32): Unit {
    }
}

extend Float64 {
    operator func [](arg1: Float64, value!: Float64): Unit {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_immutable_type_extend_assignment_index_operator
