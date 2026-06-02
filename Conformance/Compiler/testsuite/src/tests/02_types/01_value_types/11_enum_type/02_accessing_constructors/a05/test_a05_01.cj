/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a05_01

  @Level:         1

  @Assertion:       2.1.11.2(5) The enum constructor participates in the resolution of function overloading

  @Description:     Checks that enum constructors do not hide overloaded functions
  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

enum E1 {
    //| F
    | F(Bool)
    | F2(Rune)
}
enum E2<T1,T2> {
    | F1(T1)
    | F2(T1, T2, T2)
    | F3(T1, T2, Unit)
}
func F() {}
func F(s: String) { s }
func F2(s: String) { s }
func F2<T1, T2>(a:T1, b:T1, c:T2) { "F2<T1, T2>" }
func F3(x: Int64, y: Rune, z: Bool) {}

main() {
    Assert.isTrue(F() is Unit)
    Assert.equals("abc", F("abc"))
    Assert.equals("abc", F2("abc"))
    Assert.equals("F2<T1, T2>", F2('a', 'b', ('c')))

    Assert.isTrue(E1.F(true) is E1)
    Assert.isTrue(E1.F2(r'a') is E1)
    Assert.isTrue(E2<Bool,Bool>.F1(true) is E2<Bool, Bool>)
    Assert.isTrue(E2<Bool,Int64>.F2(true, 1, 2) is E2<Bool, Int64>)
    Assert.isTrue(E2<Int64, Int64>.F3(1,2,()) is E2<Int64, Int64>)
}
