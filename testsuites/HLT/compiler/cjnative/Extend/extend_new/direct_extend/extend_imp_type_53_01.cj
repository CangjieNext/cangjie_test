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

class classA<T> {
    public var a: T
    public init(i: T) {
        a = i
    }
}

class classB {}

type B = classB

type A = classA<B>

var d = 1

extend<T> classA<T> {
    public mut static prop b: Int64 {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

main(): Int64 {
    var x: Int64 = A.b
    if (x == 1) {
        return 0
    } else {
        return 1
    }
}
