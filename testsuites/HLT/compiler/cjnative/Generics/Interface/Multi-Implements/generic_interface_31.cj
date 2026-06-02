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
    return 0
}

interface I<T> {
    func foo(): Int64 {
        return 1
    }
}

class B<T, V> <: I<T> & I<V> where T <: ToString, V <: ToString {
    public func foo(): Int64 {
        return 1
    }
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}
