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
public interface F {}
public open class S1 <: F {}
public class S2 <: S1 {}
public interface I {
    static func g01() {1}
    static func g02(a: Int64, b: Int64) {a}
    static func g03(a!: Int64, b!: Int64) {b}
    static func g04(a: S1) {1}
    func g11() {1}
    func g12(a: Int64, b: Int64) {b}
    func g13(a!: Int64, b!: Int64) {a}
    func g14(a: S1) {1}
}
public class C <: I {}
