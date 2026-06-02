/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
@Annotation
public class A1 {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}
@Annotation
public class A2 {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}
public enum E1 {
    RED
    public func g() {1}
}
@A1["enum2"] public enum E2 {
    BLUE
    public func g() {1}
}
@A1["enum3"] public enum E3 {
    YELLOW
    public func g() {1}
}
