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

type Tu = (Int64, Int8)

class A {
    public var a: Tu
    public init(a: Tu) {
        this.a = a
    }
    public operator func +(right: A): String {
        return (this.a[0] + right.a[0]).toString() + (this.a[1] + right.a[1]).toString()
    }
}

main(): Int64 {
    var a: String = A((1, Int8(2))) + A((3, Int8(4)))
    if (a == "46") {
        return 0
    } else {
        return 1
    }
}
