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
    static var _a_ = 1
    static var a__ = 1
    static var __a = 1
    static var _aa = 1
    static var a_ = 1
    static var _a = 1
    init(_: Int64) {
        _ = 1
    }
}

main(): Int64 {
    if (A._a_ != 1 || A.a__ != 1 || A.__a != 1 || A._aa != 1 || A._a != 1) {
        return 1
    }
    return 0
}
