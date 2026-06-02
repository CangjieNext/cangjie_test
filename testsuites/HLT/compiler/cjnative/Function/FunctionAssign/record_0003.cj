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

var c: Int32 = 0

struct R {
    public func a() {
        c = 10
    }
    public func a1() {
        c = 11
    }
    public func a2() {
        c = 12
    }
    public func a3() {
        c = 13
    }
}

var b = R().a

main(): Int64 {
    b = R().a1
    b = R().a2
    b = R().a3
    b()
    return Int64(c - 13)
}
