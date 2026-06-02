/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

// ASSERT: scan sema_static_variable_use_generic_parameter

enum A<T> {
    E

    static prop p: Int64 {
        get() {
            {x: T => x}
            0
        }
    }
}

main() {
    return A<Int64>.p
}
