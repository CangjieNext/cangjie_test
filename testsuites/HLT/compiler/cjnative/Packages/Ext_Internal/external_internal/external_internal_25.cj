/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package packageTest

public enum TimeUnit1 {
    Year | Month | Day | Hour

    public static func foo() {
        0
    }
}

public struct A {
    public static var a = TimeUnit1.Year
    public static func foo2() {
        return TimeUnit1.foo
    }
}

extend A {
    public func foo3() {
        return foo2
    }
}

public var cc = A.foo2
public var dd = A.a

main(): Int64 {
    return cc()() + A().foo3()()()
}
