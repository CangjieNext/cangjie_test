/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a10_01

  @Level:         1

  @Comment:         Note the following: 

  @Assertion:       5.3.2(10) 2. If a function has named arguments, the sequence of the named arguments may be 
                    different from that of the parameters. During type checking, the named argument must correspond 
                    to the named parameter that matches the name.

  @Description:     Check that if the function has named parameters, then the order of the corresponding arguments for
                    named parameters is not important. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(a!: String, b!: Int32 = 7): String { "${a} + ${b}" }
    func f1(a: Int32, b!: Int32, c!: Int32 = 12): Int32 { a + b + c}
    func f2(a!: Rune, b!: Bool = true, c!: String = "OtY"): String { "${c} + ${b} + ${a}"}
}

struct myStruct {
    func f0(a!: String, b!: Int32 = 7): String { "${a} + ${b}" }
    func f1(a: Int32, b!: Int32, c!: Int32 = 12): Int32 { a + b + c}
    func f2(a!: Rune, b!: Bool = true, c!: String = "OtY"): String { "${c} + ${b} + ${a}"}
}

enum myEnum {
    H

    func f0(a!: String, b!: Int32 = 7): String { "${a} + ${b}" }
    func f1(a: Int32, b!: Int32, c!: Int32 = 12): Int32 { a + b + c}
    func f2(a!: Rune, b!: Bool = true, c!: String = "OtY"): String { "${c} + ${b} + ${a}"}
}

func f0(a!: String, b!: Int32 = 7): String { "${a} + ${b}" }
func f1(a: Int32, b!: Int32, c!: Int32 = 12): Int32 { a + b + c}
func f2(a!: Rune, b!: Bool = true, c!: String = "OtY"): String { "${c} + ${b} + ${a}"}

main() {
    Assert.equals("AAA + 7", f0(a: "AAA"))
    Assert.equals("AAA + 12", f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", f0(b: 12, a: "AAA"))

    Assert.equals(50, f1(44, b: 12, c: -6))
    Assert.equals(50, f1(44, c: -6, b: 12))
    Assert.equals(68, f1(44, b: 12))

    Assert.equals("Firq + true + h", f2(a: r'h', b: true, c: "Firq"))
    Assert.equals("Firq + true + h", f2(b: true, a: r'h', c: "Firq"))
    Assert.equals("Firq + true + h", f2(a: r'h', c: "Firq", b: true))
    Assert.equals("Firq + true + h", f2(b: true, c: "Firq", a: r'h'))
    Assert.equals("OtY + true + h", f2(b: true, a: r'h'))
    Assert.equals("Firq + true + h", f2(c: "Firq", a: r'h'))

    Assert.equals("AAA + 7", myEnum.H.f0(a: "AAA"))
    Assert.equals("AAA + 12", myEnum.H.f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", myEnum.H.f0(b: 12, a: "AAA"))

    var myClassImpl = myClass()
    Assert.equals("AAA + 7", myClassImpl.f0(a: "AAA"))
    Assert.equals("AAA + 12", myClassImpl.f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", myClassImpl.f0(b: 12, a: "AAA"))

    Assert.equals(50, myClassImpl.f1(44, b: 12, c: -6))
    Assert.equals(50, myClassImpl.f1(44, c: -6, b: 12))
    Assert.equals(68, myClassImpl.f1(44, b: 12))

    Assert.equals("Firq + true + h", myClassImpl.f2(a: r'h', b: true, c: "Firq"))
    Assert.equals("Firq + true + h", myClassImpl.f2(b: true, a: r'h', c: "Firq"))
    Assert.equals("Firq + true + h", myClassImpl.f2(a: r'h', c: "Firq", b: true))
    Assert.equals("Firq + true + h", myClassImpl.f2(b: true, c: "Firq", a: r'h'))
    Assert.equals("OtY + true + h", myClassImpl.f2(b: true, a: r'h'))
    Assert.equals("Firq + true + h", myClassImpl.f2(c: "Firq", a: r'h'))

    Assert.equals("AAA + 7", myEnum.H.f0(a: "AAA"))
    Assert.equals("AAA + 12", myEnum.H.f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", myEnum.H.f0(b: 12, a: "AAA"))

    var myStructImpl = myStruct()
    Assert.equals("AAA + 7", myStructImpl.f0(a: "AAA"))
    Assert.equals("AAA + 12", myStructImpl.f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", myStructImpl.f0(b: 12, a: "AAA"))

    Assert.equals(50, myStructImpl.f1(44, b: 12, c: -6))
    Assert.equals(50, myStructImpl.f1(44, c: -6, b: 12))
    Assert.equals(68, myStructImpl.f1(44, b: 12))

    Assert.equals("Firq + true + h", myStructImpl.f2(a: r'h', b: true, c: "Firq"))
    Assert.equals("Firq + true + h", myStructImpl.f2(b: true, a: r'h', c: "Firq"))
    Assert.equals("Firq + true + h", myStructImpl.f2(a: r'h', c: "Firq", b: true))
    Assert.equals("Firq + true + h", myStructImpl.f2(b: true, c: "Firq", a: r'h'))
    Assert.equals("OtY + true + h", myStructImpl.f2(b: true, a: r'h'))
    Assert.equals("Firq + true + h", myStructImpl.f2(c: "Firq", a: r'h'))

    Assert.equals("AAA + 7", myEnum.H.f0(a: "AAA"))
    Assert.equals("AAA + 12", myEnum.H.f0(a: "AAA", b: 12))
    Assert.equals("AAA + 12", myEnum.H.f0(b: 12, a: "AAA"))

    Assert.equals(50, myEnum.H.f1(44, b: 12, c: -6))
    Assert.equals(50, myEnum.H.f1(44, c: -6, b: 12))
    Assert.equals(68, myEnum.H.f1(44, b: 12))

    Assert.equals("Firq + true + h", myEnum.H.f2(a: r'h', b: true, c: "Firq"))
    Assert.equals("Firq + true + h", myEnum.H.f2(b: true, a: r'h', c: "Firq"))
    Assert.equals("Firq + true + h", myEnum.H.f2(a: r'h', c: "Firq", b: true))
    Assert.equals("Firq + true + h", myEnum.H.f2(b: true, c: "Firq", a: r'h'))
    Assert.equals("OtY + true + h", myEnum.H.f2(b: true, a: r'h'))
    Assert.equals("Firq + true + h", myEnum.H.f2(c: "Firq", a: r'h'))
}
