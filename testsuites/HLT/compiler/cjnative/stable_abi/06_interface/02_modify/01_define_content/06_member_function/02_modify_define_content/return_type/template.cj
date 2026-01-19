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
public interface F1 { func g() {1} }
public interface F2 <: F1 {}
public class S1 <: F2 {}
public struct S2 <: F2 {}
public interface I {
    static func g1(): F2 {S1()}
    func g2(): F2 {S1()}
    static func g3(): F2
    func g4(): F2
}
