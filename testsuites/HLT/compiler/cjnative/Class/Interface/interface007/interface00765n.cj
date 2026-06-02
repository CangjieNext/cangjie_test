/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    mut static prop a: Int64
}

abstract class A <: I {
    public mut static prop b: Int64 {
        get() {
            a
        }
        set(v) {}
    }
}

main(): Int64 {
    return A.b
}
// ASSERT: scan sema_inherit_abstract_class_static_unimplement_func
