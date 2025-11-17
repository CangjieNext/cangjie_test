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
    public func g1() {1}
    protected func g2() {1}
    internal func g3() {1}
    private func g4() {1}
    func g5() {g4()}
    protected func g6() {1}
    func g7() {1}
}
@Frozen public func f() {A.g6() + A.g7()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.g2(), 1)
    assert(A.g3(), 1)
    assert(A.g5(), 1)
}
