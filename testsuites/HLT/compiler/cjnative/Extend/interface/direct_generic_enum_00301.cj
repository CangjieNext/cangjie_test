/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a: Int64 = 5

enum A<T> {
    EA
}

extend<T> A<T> <: I<T> {
    public mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

interface I<T> {
    mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main() {
    A<Int64>.pa = 1
    return A<Int64>.pa - 1
}
// ASSERT: scan sema_immutable_type_illegal_property
