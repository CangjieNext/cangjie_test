/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

@Annotation
public class Ann1 {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}
@Annotation
public class Ann2 {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}
public enum E1 {
    | A
    public func f1(): Int64 {1}
    @Ann1["f"] public func f2(): Int64 {2}
    func f3(): Int64 {3}
    @Ann1["f"] func f4(): Int64 {4}
}
enum E2 {
    | B
    public func f1(): Int64 {1}
    @Ann1["f"] public func f2(): Int64 {2}
}
enum E3 {
    | C
    public func f1(): Int64 {1}
    @Ann1["f"] public func f2(): Int64 {2}
}
public class cls {public var a = B.f1() + B.f2()}
@Frozen public func f() {A.f3() + A.f4() + C.f1() + C.f2()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(A.f3(), 3)
    assert(A.f4(), 4)
    assert(B.f1(), 1)
    assert(B.f2(), 2)
    assert(C.f1(), 1)
    assert(C.f2(), 2)
}
