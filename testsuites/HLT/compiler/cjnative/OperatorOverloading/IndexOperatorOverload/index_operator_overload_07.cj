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

// 不声明返回类型
class A {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }
    public operator func [](index: Int64, value!: Int64) {
        this.b = value
    }
}

main(): Int64 {
    var a = A(2)
    a[2] = 4
    if (a.b == 4) {
        return 0
    }
    return 1
}
