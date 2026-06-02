/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a04_01

  @Level:         1

  @Assertion:       5.3.4(4) 3.Only the last position of the non-named parameter can use variable-length argument.

  @Description:     Check that if the last non-named parameter is of Arraytype, the function can be called using 
                    syntax sugar.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(arr: Array<Rune>): String { "f0" }
    func f1(a: Bool, arr: Array<Rune>): String { "f1" }
    func f2(a: Int32, arr: Array<Rune>, b!: String): String { "f2" }
}

struct myStruct {
    func f0(arr: Array<Rune>): String { "f0" }
    func f1(a: Bool, arr: Array<Rune>): String { "f1" }
    func f2(a: Int32, arr: Array<Rune>, b!: String): String { "f2" }
}

enum myEnum {

    S

    func f0(arr: Array<Rune>): String { "f0" }
    func f1(a: Bool, arr: Array<Rune>): String { "f1" }
    func f2(a: Int32, arr: Array<Rune>, b!: String): String { "f2" }
}

func f0(arr: Array<Rune>): String { "f0" }
func f1(a: Bool, arr: Array<Rune>): String { "f1" }
func f2(a: Int32, arr: Array<Rune>, b!: String): String { "f2" }

main() {
    Assert.equals("f0", f0([r'f',r'R',r'f']))
    Assert.equals("f0", f0(r'f',r'R',r'f'))

    Assert.equals("f1", f1(true, [r'f',r'R',r'f']))
    Assert.equals("f1", f1(true, r'f',r'R',r'f'))

    Assert.equals("f2", f2(12, [r'f',r'R',r'f'], b: "DDD"))
    Assert.equals("f2", f2(12, r'f',r'R',r'f', b: "DDD"))

    var myClassImpl = myClass()
    Assert.equals("f0", myClassImpl.f0([r'f',r'R',r'f']))
    Assert.equals("f0", myClassImpl.f0(r'f',r'R',r'f'))

    Assert.equals("f1", myClassImpl.f1(true, [r'f',r'R',r'f']))
    Assert.equals("f1", myClassImpl.f1(true, r'f',r'R',r'f'))

    Assert.equals("f2", myClassImpl.f2(12, [r'f',r'R',r'f'], b: "DDD"))
    Assert.equals("f2", myClassImpl.f2(12, r'f',r'R',r'f', b: "DDD"))

    var myStructImpl = myStruct()
    Assert.equals("f0", myStructImpl.f0([r'f',r'R',r'f']))
    Assert.equals("f0", myStructImpl.f0(r'f',r'R',r'f'))

    Assert.equals("f1", myStructImpl.f1(true, [r'f',r'R',r'f']))
    Assert.equals("f1", myStructImpl.f1(true, r'f',r'R',r'f'))

    Assert.equals("f2", f2(12, [r'f',r'R',r'f'], b: "DDD"))
    Assert.equals("f2", f2(12, r'f',r'R',r'f', b: "DDD"))

    Assert.equals("f0", myEnum.S.f0([r'f',r'R',r'f']))
    Assert.equals("f0", myEnum.S.f0(r'f',r'R',r'f'))

    Assert.equals("f1", myEnum.S.f1(true, [r'f',r'R',r'f']))
    Assert.equals("f1", myEnum.S.f1(true, r'f',r'R',r'f'))

    Assert.equals("f2", myEnum.S.f2(12, [r'f',r'R',r'f'], b: "DDD"))
    Assert.equals("f2", myEnum.S.f2(12, r'f',r'R',r'f', b: "DDD"))
}
