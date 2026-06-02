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

var a1: Array<Int8> = [1, 2, 3]

struct A {
    public static var a1: Array<Int8> = [1, 2, 3]

    public var a2: Array<Int8> = [-1, -2, -3]
    public init() {}
}

main(): Int64 {
    let a = A()

    if (A.a1[0] == 1 && A.a1[1] == 2 && A.a1[2] == 3 && a.a2[0] == -1 && a.a2[1] == -2 && A().a2[2] == -3) {
        return 0
    }

    return 1
}
