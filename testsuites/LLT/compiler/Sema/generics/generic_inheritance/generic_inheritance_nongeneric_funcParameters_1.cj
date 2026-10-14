// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (B<String, Int64>().m != 1) {
        return 1
    }
    return 0
}

interface I1<T> {
    func foo(): Int64 {
        return 1
    }
}

interface I2<T> <: I1<T> {}

interface J<T, V> <: I1<T> & I2<V> {}

class B<T, V> <: I1<T> & I2<V> {
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}
