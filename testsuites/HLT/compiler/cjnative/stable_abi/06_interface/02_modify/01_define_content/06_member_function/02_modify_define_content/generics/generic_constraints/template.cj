/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface F1 { static func g() {1} }
public interface F2 { static func g() {1} }
public open class S1 <: F1 {}
public class S2 <: S1 & F2 { public static func g() {2} }
public interface I {
    static func g1<T1, T2, T3>(a: T1, b: T2) where T1 <: F1 & F2, T2 <: S1 { 1 }
    func g2<T1, T2, T3>(a: T1, b: T2) where T1 <: F1 & F2, T2 <: S1 { 1 }
}
public class C <: I {}
