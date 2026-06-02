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

open class A {
    public var a1: Array<Float64> = [1.0, 2.0, 3.0]
}

class B <: A {
    public var a2: Array<Float64> = [1.0, 2.0, 3.0]
}

main(): Int64 {
    var b = B()

    if (b.a2[0] == 1.0 && b.a2[1] == 2.0 && b.a2[2] == 3.0 && B().a1[0] == 1.0 && B().a1[1] == 2.0 && B().a1[2] == 3.0) {
        return 0
    }

    return 1
}
