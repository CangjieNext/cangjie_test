/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (C<A<String>, String>().a != 1) {
        return 1
    }
    return 0
}

open class A<T> {
    public static var a = 1
}

struct C<T, V> where T <: A<V>, V <: ToString {
    public prop a: Int64 {
        get() {
            return 1
        }
    }
}
