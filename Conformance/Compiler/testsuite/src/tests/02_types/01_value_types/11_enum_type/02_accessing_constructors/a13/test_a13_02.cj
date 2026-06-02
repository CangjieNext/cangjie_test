/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a13_02

  @Level:         1

  @Assertion:       2.1.11.2(13) The enum constructor, when used with the type prefix omitted, 
  can declare generic parameters of type enum after the constructor name.

  @Description:     Checks that generic parameter of enum can not be placed after fully qualified constructor

  @Mode:            Compileonly
  @Negative:        yes
  @Structure:       single

  @Comment:

*/
enum E<T1, T2> {
    | Year
    | Month(T1)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}

let t1 = E.Day<String, Bool>("1.0", true, false)
var t2 = E<Rune, Unit>.Year<Rune, Unit>
let t3 = E.Month<E<String, Bool>, (ToString, Comparable<Bool>)>(t1)

main() {
}
