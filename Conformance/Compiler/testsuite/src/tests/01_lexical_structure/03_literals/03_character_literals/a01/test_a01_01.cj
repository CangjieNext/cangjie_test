/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            01_03_03_a01_01

  @Level:         1

  @Assertion:       1.3.3(1) A character literal consisting of a pair of single quotes and the character itself.

  @Description:     Check character literal correctness

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

func myFunc0() {
    r'\\'
}
func myFunc1() {
    r'\f'
}
func myFunc2() {
    r'\n'
}
func myFunc3() {
    r'\r'
}
func myFunc4() {
    r'\t'
}
func myFunc5() {
    r'\v'
}
func myFunc6() {
    r'\''
}
func myFunc7() {
    r'\"'
}
func myFunc8() {
    r'\$'
}

main() {
    Assert.isTrue(r'A' == r'A')
    Assert.isTrue(r'A' < r'a') 
    Assert.isTrue(r'A' <= r'A')
    Assert.isTrue(r'A' >= r'A')
    Assert.isTrue(r'0' == r'0')
    Assert.isTrue(r'A' is Rune)
    Assert.equals(r'\\', myFunc0())
    Assert.isTrue(r'\b' is Rune)
    Assert.equals(r'\f', myFunc1())
    Assert.equals(r'\n', myFunc2())
    Assert.equals(r'\r', myFunc3())
    Assert.equals(r'\t', myFunc4())
    Assert.equals(r'\v', myFunc5())
    Assert.equals(r'\'', myFunc6())
    Assert.equals(r'\"', myFunc7())
    Assert.equals(r'\$', myFunc8())
    Assert.isTrue(r'\u{A}' is Rune)
    return 0
}

