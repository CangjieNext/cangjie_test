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
    @Frozen public prop p2: Int64 {get(){1}}
    prop p3: Int64 {get(){1}}
    @Frozen prop p4: Int64 {get(){1}}
}
@Frozen public func f() {A.p3 + A.p4}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.p3, 1)
    assert(A.p4, 1)
}
