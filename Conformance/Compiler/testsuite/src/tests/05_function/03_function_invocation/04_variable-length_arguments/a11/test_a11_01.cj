/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a11_01

  @Level:         1

  @Assertion:       5.3.4(11) The function overloading resolution will always give preference to functions that can 
                    be matched without using variable-length arguments, and will only try to use variable-length 
                    argument resolution if all functions cannot be matched.
                    The compiler will report an error when it cannot resolve.

  @Description:     Check that function without using variable-length arguments has an preference.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

open class myOpenClass {
    func g(arg1: Int64, arg2: Int64): String {
        return "from myOpenClass (2) ${arg1 + arg2}"
    }
    func f(arg1: Int64, arg2: Rune): String {
        return "from myOpenClass (2) ${arg1} + ${arg2}"
    }
    func g(arg1: Int64, arg2: Int64, arg3: Int64): String {
        return "from myOpenClass (3) ${arg1 + arg2 + arg3}"
    }
    func f(arg1: Int64, arg2: Rune, arg3: Rune): String {
        return "from myOpenClass (3) ${arg1} + ${arg2} + ${arg3}"
    }
}
class myClass <: myOpenClass {
    func g(pos: Int64, arg: Array<Int64>): String {
        return "from myClass ${arg[pos]}"
    }
    func f(pos: Int64, arg: Array<Rune>): String {
        return "from myClass ${pos} ${arg[pos]}"
    }
}


main() {
    var myClassImpl = myClass()
    var arr = [3, 7, 8, -23]
    Assert.equals("from myClass 3", myClassImpl.g(0, arr))
    Assert.equals("from myClass 7", myClassImpl.g(1, arr))
    Assert.equals("from myClass 8", myClassImpl.g(2, arr))
    Assert.equals("from myClass -23", myClassImpl.g(3, arr))

    var arrC = [r'A', r'B', r'C', r'G']
    Assert.equals("from myClass 0 A", myClassImpl.f(0, arrC))
    Assert.equals("from myClass 1 B", myClassImpl.f(1, arrC))
    Assert.equals("from myClass 2 C", myClassImpl.f(2, arrC))
    Assert.equals("from myClass 3 G", myClassImpl.f(3, arrC))


    Assert.equals("from myOpenClass (2) 4", myClassImpl.g(1, 3))
    Assert.equals("from myOpenClass (3) 11", myClassImpl.g(1, 3, 7))

    Assert.equals("from myOpenClass (2) 1 + 3", myClassImpl.f(1, r'3'))
    Assert.equals("from myOpenClass (3) 1 + 3 + 7", myClassImpl.f(1, r'3', r'7'))


    Assert.equals("from myClass 3", myClassImpl.g(0, 3, 7, 8, -23))
    Assert.equals("from myClass 7", myClassImpl.g(1, 3, 7, 8, -23))
    Assert.equals("from myClass 8", myClassImpl.g(2, 3, 7, 8, -23))
    Assert.equals("from myClass -23", myClassImpl.g(3, 3, 7, 8, -23))

    Assert.equals("from myClass 0 3", myClassImpl.f(0, r'3', r'7', r'8', r'B'))
    Assert.equals("from myClass 1 7", myClassImpl.f(1, r'3', r'7', r'8', r'B'))
    Assert.equals("from myClass 2 8", myClassImpl.f(2, r'3', r'7', r'8', r'B'))
    Assert.equals("from myClass 3 B", myClassImpl.f(3, r'3', r'7', r'8', r'B'))

}
