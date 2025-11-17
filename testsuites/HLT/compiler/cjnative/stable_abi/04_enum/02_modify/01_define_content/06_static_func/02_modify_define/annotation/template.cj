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
    public static func f1(): Int64 {1}
    @Ann1["f"] public static func f2(): Int64 {2}
    static func f3(): Int64 {3}
    @Ann1["f"] static func f4(): Int64 {4}
}
enum E2 {
    | B
    public static func f1(): Int64 {1}
    @Ann1["f"] public static func f2(): Int64 {2}
}
enum E3 {
    | C
    public static func f1(): Int64 {1}
    @Ann1["f"] public static func f2(): Int64 {2}
}
public class cls {public var a = E2.f1() + E2.f2()}
@Frozen public func f() {E1.f3() + E1.f4() + E3.f1() + E3.f2()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E1.f3(), 3)
    assert(E1.f4(), 4)
    assert(E2.f1(), 1)
    assert(E2.f2(), 2)
    assert(E3.f1(), 1)
    assert(E3.f2(), 2)
}
