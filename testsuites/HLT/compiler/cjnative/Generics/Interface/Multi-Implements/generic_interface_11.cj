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
    if (B1<String>().m != 2) {
        return 1
    }
    if (B2<String>().m != 3) {
        return 1
    }
    return 0
}

open class A<T> {
    public static var a: Int64 = 1
    public func foo() {
        return a
    }
}

class B1<T> <: A<T> {
    public prop m: Int64 {
        get() {
            A<T>.a = 2
            return foo()
        }
    }
}

class B2<T> <: A<T> {
    public prop m: Int64 {
        get() {
            A<T>.a = 3
            return foo()
        }
    }
}
