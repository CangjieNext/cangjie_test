// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class B {
    public static var a: A = A()
    public var b: Int64 = 1
    public static var lambda: () -> A = {=> A()}
    public static var lambda1: () -> B = {=> B()}
}

class A {
    public var b: B = B()
    public var c: Int64 = 10
}

main(): Int64 {
    if (B.a.c == 10 && B.lambda().c == 10 && B.lambda1().b == 1) {
        return 0
    }
    return 1
}
