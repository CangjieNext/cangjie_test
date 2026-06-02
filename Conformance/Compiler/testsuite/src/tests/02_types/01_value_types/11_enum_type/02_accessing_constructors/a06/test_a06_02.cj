/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a06_02

  @Level:         1

  @Assertion:       2.1.11.2(6) When it is not possible to resolve, both the enum constructor and the function 
  cannot be used directly, so the enum constructor needs to be used by type prefixing 
  and the function needs to be used by prefix qualification.

  @Description:     Checks that functions overlapping w/ enums can be used w/ package prefix

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
package p

import utils.assert.Assert

enum E1 {
    //| F
    | F(Bool)
    | F2(Rune)
}
enum E2<T1,T2> {
    | F1(T1)
    | F2(T1, T2, T2)
    | F3(T1, T2)
}
func F(b: Bool) { b }
func F2(s: Rune) { s }
func F1(s: String) { s }
func F2<T1, T2>(a:T1, b:T2, c:T2) { "F2<T1, T2>" }
func F3(x: Int64, y: Rune) {}

main() {
    Assert.isTrue(F(true) is Bool)
    Assert.isTrue(F2(r'x') is Rune)
    Assert.isTrue(F1("true") is String)
    Assert.isTrue(F2(true, 1, 2) is String)
    Assert.isTrue(F3(1,r'a') is Unit)
}
