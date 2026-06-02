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

type arr<T> = Array<Int64>

type A = classA

interface I {
    static func d(a: A) {
        a
    }
}

class classA {
    public var a: arr<Int32>
    public init(a: arr<Int32>) {
        this.a = a
    }
    public operator func -(): arr<String> {
        for (i in 0..this.a.size) {
            this.a[i] = -this.a[i]
        }
        return this.a
    }
}

extend A <: I {}

main(): Int64 {
    var a: arr<Bool> = -A.d(A([1, 2, 3]))
    if (a[0] == -1 && a[1] == -2 && a[2] == -3) {
        return 0
    } else {
        return 1
    }
}
