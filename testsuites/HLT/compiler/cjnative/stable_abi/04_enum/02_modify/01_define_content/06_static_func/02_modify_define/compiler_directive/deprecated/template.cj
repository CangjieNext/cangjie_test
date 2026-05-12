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
    @Deprecated["deprecated", strict: false] public static func g2() {1}
    @Deprecated["deprecated", strict: true] public static func g3() {1}
    static func g4() {1}
    @Deprecated["deprecated", strict: false] static func g5() {1}
    @Deprecated["deprecated", strict: true] static func g6() {1}
}
@Frozen public func f1() {E.g4() + E.g5()}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {E.g3() + E.g6()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E.g4(), 1)
    assert(E.g5(), 1)
}
