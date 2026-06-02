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

interface A {
    func i() {}
    static func test() {
        X().i()
    }
}

class X <: A {}

class B {
    public func i() {}
    public static func test() {
        B().i()
    }
}

abstract class C {
    public func i() {}
    public static func test() {
        Y().i()
    }
}

class Y <: C {}

main() {
    X.test()
    B.test()
    Y.test()
    return 0
}
