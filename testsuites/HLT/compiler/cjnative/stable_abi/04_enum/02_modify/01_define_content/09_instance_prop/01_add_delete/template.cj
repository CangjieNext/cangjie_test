/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public enum E1 {
    | A
    public prop p1: Int64 {get(){1}}
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
enum E2 {
    | B
    public prop p: Int64 {get(){1}}
    public prop p1: Int64 {get(){1}}
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
enum E3 {
    | C
    public prop p: Int64 {get(){1}}
    public prop p1: Int64 {get(){1}}
    protected prop p2: Int64 {get(){2}}
    private prop p3: Int64 {get(){3}}
    prop p4: Int64 {get(){4}}
    func g() { p3 }
}
public class cls { public var a = B.p }
@Frozen public func f() { C.p }
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.p2, 2)
    assert(A.p4, 4)
    assert(A.g(), 3)
    assert(B.p1, 1)
    assert(B.p2, 2)
    assert(B.p4, 4)
    assert(B.g(), 3)
    assert(C.p1, 1)
    assert(C.p2, 2)
    assert(C.p4, 4)
    assert(C.g(), 3)
}
