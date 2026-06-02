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
    if (C1<String>().m != 4) {
        return 1
    }
    if (B2<String>().m != 3) {
        return 1
    }
    return 0
}

interface I<T> {
    func foo1(): Int64 {
        return 1
    }
}

interface J<V> <: I<V> {
    prop m: Int64 {
        get() {
            return foo1()
        }
    }
}

class B2<K> <: I<K> {
    public prop m: Int64 {
        get() {
            return foo1() + 2
        }
    }
}

class C1<M> <: J<M> {
    public prop m: Int64 {
        get() {
            return foo1() + 3
        }
    }
}
