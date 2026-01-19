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
public interface I {
    static func g1() {1}
    func g2() {1}
    static const func g3() {1}
    const func g4() {1}
    @Frozen
    static func g5() {1}
    @Frozen
    func g6() {1}
}
public class C <: I {}
