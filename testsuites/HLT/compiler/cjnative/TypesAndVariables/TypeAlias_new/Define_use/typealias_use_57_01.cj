/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A<T> = structA<T, Bool>

struct structA<T, K> {
    public var a: T
    public var b: K
    public structA(var x: T, var y: K) {
        this.a = x
        this.b = y
    }
}

struct B {
    public func a(a: A<String>) {
        if (a.a == a.b.toString()) {
            return true
        } else {
            return false
        }
    }
}

main(): Int64 {
    if (B().a(A<String>("true", true))) {
        return 0
    } else {
        return 1
    }
}
