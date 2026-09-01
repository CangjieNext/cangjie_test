// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan NotEqual(
// ASSERT: scan LE(
// ASSERT: scan Apply(Class-_CN7default1AE&->@_CN7defaultXCNY_1AEneHY1_
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7defaultXCNY_1AEneHY1_

func TestNotEqual<T>(a: Equatable<T>, b: T): Int64 {
    if (a != b) {
        1
    } else {
        0
    }
}

func TestCompare<T>(a: Comparable<T>, b: T): Int64 {
    if (a <= b) {
        1
    } else {
        0
    }
}

class A {}

extend A <: Equatable<A> {
    public operator func ==(rhs: A): Bool {
        return false
    }
    public operator func !=(rhs: A): Bool {
        return true
    }
}

main() {
    TestNotEqual(1, 2) + TestCompare(1.1, 2.2) + TestNotEqual(A(), A()) - 3
}
