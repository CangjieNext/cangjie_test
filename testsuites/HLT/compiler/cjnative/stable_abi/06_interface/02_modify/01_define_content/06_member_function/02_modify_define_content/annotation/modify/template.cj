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
@Annotation
public class Version1 {
    let code: String
    const init(code: String) { this.code = code }
}
@Annotation
public class Version2 {
    let code: String
    const init(code: String) { this.code = code }
}
public interface I {
    @Version1["1.1"]
    static func g1() {1}
    @Version1["1.1"]
    func g2() {1}
    @Version1["1.1"]
    static func g3(): Int64
    @Version1["1.1"]
    func g4(): Int64
}
public class C <: I {
    public static func g3(): Int64 {1}
    public func g4(): Int64 {1}
}
