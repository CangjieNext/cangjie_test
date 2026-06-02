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
class A {
    static let _a_ = 1
    static let a__ = 1
    static let __a = 1
    static let _aa = 1
    static let a_ = 1
    static let _a = 1

    var _b: Int64
    var _b_: Int64
    var __b_: Int64

    public A(_: Int64, _a: Int64, _a_!: Int64, __a_!: Int64 = 1) {
        this._b = 1
        this._b_ = 1
        this.__b_ = 1
    }
}

main(): Int64 {
    if (A._a_ != 1 || A.a__ != 1 || A.__a != 1 || A._aa != 1 || A._a != 1) {
        return 1
    }
    var temp_var = A(1, 1, _a_: 1, __a_: 1)

    if (temp_var._b != 1 || temp_var._b_ != 1 || temp_var.__b_ != 1) {
        return 1
    }
    return 0
}
