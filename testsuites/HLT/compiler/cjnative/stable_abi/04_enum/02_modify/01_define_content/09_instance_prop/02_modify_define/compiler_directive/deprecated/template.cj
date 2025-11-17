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
    public prop p1: Int64 {get(){1}}
    @Deprecated["deprecated", strict: false] public prop p2: Int64 {get(){1}}
    @Deprecated["deprecated", strict: true] public prop p3: Int64 {get(){1}}
    prop p4: Int64 {get(){1}}
    @Deprecated["deprecated", strict: false] prop p5: Int64 {get(){1}}
    @Deprecated["deprecated", strict: true] prop p6: Int64 {get(){1}}
}
@Frozen public func f1() {A.p4 + A.p5}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {A.p3 + A.p6}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.p4, 1)
    assert(A.p5, 1)
}
