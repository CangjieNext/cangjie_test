/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a06_01

  @Level:         1

  @Assertion:       2.1.11.2(6) When it is not possible to resolve, both the enum constructor and the function 
  cannot be used directly, so the enum constructor needs to be used by type prefixing 
  and the function needs to be used by prefix qualification.

  @Description:     Checks that enum constructors overlapping w/ functions can be used 
  by type prefix w/o package prefix

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
package p

import utils.assert.Assert

enum E1 {
    //| F
    | F1(Bool)
    | F2(Rune)
}
enum E2<T1,T2> {
    | F1(T1)
    | F2(T1, T2, T2)
    | F3(T1, T2)
}
func F1(b: Bool) { b }
func F2(s: Rune) { s }
func F1(s: String) { s }
func F2<T1, T2>(a:T1, b:T2, c:T2) { "F2<T1, T2>" }
func F3(x: Int64, y: Rune) {}

main() {
    Assert.isTrue(E1.F1(true) is E1)
    Assert.isTrue(E1.F2(r'x') is E1)
    Assert.isTrue(E2<Bool,Bool>.F1(true) is E2<Bool, Bool>)
    Assert.isTrue(E2.F2(true, 1, 2) is E2<Bool, Int64>)
    Assert.isTrue(E2.F3(1,2) is E2<Int64, Int64>)
}