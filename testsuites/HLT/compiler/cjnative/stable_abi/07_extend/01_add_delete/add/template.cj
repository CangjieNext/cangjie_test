/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: add extend
public interface I1 {
    func f1(): Int64
    func f2() {
        2
    }
}

private interface I2 {}

public open class C1 {}

public class C2 {
    public const init() {}
}

public open class C3<T, U> where T <: ToString {}

public class C4 <: C1 {}

public class C5<T, U> <: C3<T, U> where T <: ToString {}

public struct S1 {}

public struct S2<T, U> where U <: C1 {}

extend C1 {
    public func f_c1() {
        1
    }
}

extend C2 {
    public func f_c2() {
        2
    }
}

extend<T, U> C3<T, U> {
    public func f_c3() {
        3
    }
}

extend C4 {
    public func f_c4() {
        4
    }
}

extend C5<Int64, I1> {
    public func f_c5() {
        5
    }
}

extend S1 {
    public func f_s1() {
        1
    }
}

extend<X, Y> S2<X, Y> {
    public func f_s2() {
        2
    }
}
