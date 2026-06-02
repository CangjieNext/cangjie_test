
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a13_083

  @Level:         1

  @Assertion:   4.18(13) If the value of the right operand of the bitwise left/right shift operator is equal to or
                greater than the length of the left operand, overshift occurs and a compilation error is reported if it
                is detected at compile time or a run-time exception is thrown.
  @Description: Checks that having right operand equal to bitsize of type of the left operand for >> for types Int8
                and Int32 gives a compilation error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/


main() {
    let v1 : Int8 = 1
    let v2 : Int32 = 8
    v1 >> v2
}
