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

class A<T> {
    mut static prop a: (T) -> T {
        get() {
            {x: T => x}
        }
        set(v) {
            {x: T => x}
            v
        }
    }
}

main() {
    return A<Int64>.a(0)
}
