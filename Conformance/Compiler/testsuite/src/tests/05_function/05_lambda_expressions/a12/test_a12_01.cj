/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a12_01

  @Level:         1

  @Assertion:       5.5(12) The content on the right side of => is the same as the rules for normal function bodies, 
                    and again return can be omitted. 

  @Description:     Check that 'return' can be ommited

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    var concat1 = {a: Rune, b: Rune => "${a} + ${b}"}
    var concat2 = {a: Rune, b: Rune => return "${a} + ${b}"}
}

struct myStruct {
    var concat1 = {a: Rune, b: Rune => "${a} + ${b}"}
    var concat2 = {a: Rune, b: Rune => return "${a} + ${b}"}
}

enum myEnum {
    D

    func f0(a: Rune, b: Rune): String {
        {a: Rune, b: Rune => "${a} + ${b}"}(a, b)
    }
    func f1(a: Rune, b: Rune): String {
        {a: Rune, b: Rune => return "${a} + ${b}"}(a, b)
    }
}

main() {
    var concat1 = {a: Rune, b: Rune => "${a} + ${b}"}
    var concat2 = {a: Rune, b: Rune => return "${a} + ${b}"}

    Assert.equals("A + f", concat1(r'A', r'f'))
    Assert.equals("A + f", concat2(r'A', r'f'))

    var myClassImpl = myClass()
    Assert.equals("A + f", myClassImpl.concat1(r'A', r'f'))
    Assert.equals("A + f", myClassImpl.concat2(r'A', r'f'))

    var myStructImpl = myStruct()
    Assert.equals("A + f", myStructImpl.concat1(r'A', r'f'))
    Assert.equals("A + f", myStructImpl.concat2(r'A', r'f'))

    Assert.equals("A + f", myEnum.D.f0(r'A', r'f'))
    Assert.equals("A + f", myEnum.D.f1(r'A', r'f'))
}
