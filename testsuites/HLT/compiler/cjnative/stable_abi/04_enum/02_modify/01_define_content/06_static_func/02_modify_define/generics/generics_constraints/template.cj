/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public interface I1 {public func f() {1}}
public interface I2 {}
public open class C1 <: I1 {}
public class C2 <: C1 & I2 {}
public enum E {
    | A
    public static func g1<T1, T2>(a: T1, b: T2) where T1 <: I1 & I2, T2 <: C1 {a.f() + b.f()}
    static func g2<T1, T2>(a: T1, b: T2) where T1 <: I1 & I2, T2 <: C1 {a.f() + b.f()}
}
@Frozen public func f() {E.g2<C2, C1>(C2(), C1())}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
