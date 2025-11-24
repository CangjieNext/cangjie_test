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
    @Deprecated["deprecated", strict: false] public func g2() {1}
    @Deprecated["deprecated", strict: true] public func g3() {1}
    func g4() {1}
    @Deprecated["deprecated", strict: false] func g5() {1}
    @Deprecated["deprecated", strict: true] func g6() {1}
}
@Frozen public func f1() {A.g4() + A.g5()}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {A.g3() + A.g6()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.g4(), 1)
    assert(A.g5(), 1)
}
