// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public func add(x: Int64, y: Int64) {x + y}
public func sub(x: Int64, y: Int64) {x - y}
struct S1 {
    let structS1_Field_x : Int64 = 42
}
public struct S2 {
    let s1 : S1 = S1()
}
public let globalVar1 = S2()
public let globalVar2 = S2()
private let globalVar3 = S2()
private let globalVar4 = S2()
public let anotherRemoved = 42
public var anotherRemoved2 = 43
public var anotherRemoved3 = 44
private func moo(x: Int64) {x + 42}
public func goo() {0}
public func foo() {moo(100)}

main() {}