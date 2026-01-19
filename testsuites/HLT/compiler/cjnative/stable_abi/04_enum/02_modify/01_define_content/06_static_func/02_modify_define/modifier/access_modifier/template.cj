/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public enum E {
    | A
    public static func g1() {1}
    protected static func g2() {1}
    internal static func g3() {1}
    private static func g4() {1}
    static func g5() {g4()}
    protected static func g6() {1}
    static func g7() {1}
}
@Frozen public func f() {E.g6() + E.g7()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E.g2(), 1)
    assert(E.g3(), 1)
    assert(E.g5(), 1)
}
