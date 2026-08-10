// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public func add(x: Int64, y: Int32) {x + Int64(y)}  // <-- type of arg x modified
public func sub(x: Int64) {x - 1}                   // <-- number of args modified
struct S1 {
    let structS1_Field_x : Int64 = 42
    let structS1_Field_y : Int64 = 100              // <-- field added
}
public struct S2 {
    let s1 : S1 = S1()
}
                                                    // <-- var deleted
public let globalVar2 = S2()
                                                    // <-- var deleted
private let globalVar4 = S2()
public let globalVar5 = S2()
private let globalVar6 = S2()
                                                    // <-- var globalVar7 deleted
                                                    // <-- var globalVar8 deleted
                                                    // <-- var globalVar9 deleted
private func moo(x: Int64) {x + 42}
                                                    // <-- function goo deleted
public func bar() {2}                               // <-- function bar added
public func foo() {moo(100)}

main() {}