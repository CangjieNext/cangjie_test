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
    public operator func +(right: A): (Tu, Tu) {
        return ((this.a[0], right.a[1]), (right.a[0], this.a[1]))
    }
}

main(): Int64 {
    var a: (Tu, Tu) = A((1, Int8(2))) + A((3, Int8(4)))
    if (a[0][0] == 1 && a[0][1] == 4 && a[1][0] == 3 && a[1][1] == 2) {
        return 0
    } else {
        return 1
    }
}
