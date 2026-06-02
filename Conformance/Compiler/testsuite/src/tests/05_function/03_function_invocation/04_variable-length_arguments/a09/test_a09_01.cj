/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a09_01

  @Level:         1

  @Assertion:       5.3.4(9) 6.Variable-length arguments only determine whether the syntactic sugar can be applied if 
                    all cases of function overloading do not match, with the lowest priority.

  @Description:     Check that if there is a function overloading with the same name and different number of 
                    parameters of the same type, then a function call with an variable-length parameter using the 
                    syntax sugar will be performed only if a suitable variant will be not found.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f(arr: Array<Rune>): String { "f0" }
    func f(a: Rune): String { "f1" }
    func f(a: Rune, b: Rune): String { "f2" }
    func f(a: Rune, b: Rune, c: Rune): String { "f3" }
}

struct myStruct {
    func f(arr: Array<Rune>): String { "f0" }
    func f(a: Rune): String { "f1" }
    func f(a: Rune, b: Rune): String { "f2" }
    func f(a: Rune, b: Rune, c: Rune): String { "f3" }
}

enum myEnum {

    S

    func f(arr: Array<Rune>): String { "f0" }
    func f(a: Rune): String { "f1" }
    func f(a: Rune, b: Rune): String { "f2" }
    func f(a: Rune, b: Rune, c: Rune): String { "f3" }
}

func f(arr: Array<Rune>): String { "f0" }
func f(a: Rune): String { "f1" }
func f(a: Rune, b: Rune): String { "f2" }
func f(a: Rune, b: Rune, c: Rune): String { "f3" }


main() {
    Assert.equals("f0", f([r'C']))
    Assert.equals("f1", f(r'C'))
    Assert.equals("f2", f(r'C',r'h'))
    Assert.equals("f3", f(r'C',r'g',r'e'))
    Assert.equals("f0", f(r'C',r'g',r'e',r'T'))

    var myClassImpl = myClass()
    Assert.equals("f0", myClassImpl.f([r'C']))
    Assert.equals("f1", myClassImpl.f(r'C'))
    Assert.equals("f2", myClassImpl.f(r'C',r'h'))
    Assert.equals("f3", myClassImpl.f(r'C',r'g',r'e'))
    Assert.equals("f0", myClassImpl.f(r'C',r'g',r'e',r'T'))

    var myStructImpl = myStruct()
    Assert.equals("f0", myStructImpl.f([r'C']))
    Assert.equals("f1", myStructImpl.f(r'C'))
    Assert.equals("f2", myStructImpl.f(r'C',r'h'))
    Assert.equals("f3", myStructImpl.f(r'C',r'g',r'e'))
    Assert.equals("f0", myStructImpl.f(r'C',r'g',r'e',r'T'))

    Assert.equals("f0", myEnum.S.f([r'C']))
    Assert.equals("f1", myEnum.S.f(r'C'))
    Assert.equals("f2", myEnum.S.f(r'C',r'h'))
    Assert.equals("f3", myEnum.S.f(r'C',r'g',r'e'))
    Assert.equals("f0", myEnum.S.f(r'C',r'g',r'e',r'T'))
}
