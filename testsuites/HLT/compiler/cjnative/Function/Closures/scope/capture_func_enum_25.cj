/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    a.ifoo11()(a)
    a.ifoo12()()
    a.ifoo13()()
    a.ifoo14()(b)
    a.ifoo15()()
    a.ifoo16()()
    return 0
}

enum Eoo {
    a | b

    public func ifoo11() {
        return ifoo1
    }
    public func ifoo1(x!: Eoo = a) {
        return x
    } // x = a is call constructor a
    public func ifoo2() {
        var x = a;
        return x
    }
    public func ifoo3() {
        return a
    }
    public func ifoo4(x!: Eoo = b) {
        return x
    }
    public func ifoo5() {
        var x = b;
        return x
    }
    public func ifoo6() {
        return b
    }
    public func ifoo12() {
        return ifoo2
    }
    public func ifoo13() {
        return ifoo3
    }
    public func ifoo14() {
        return ifoo4
    }
    public func ifoo15() {
        return ifoo5
    }
    public func ifoo16() {
        return ifoo6
    }
}
