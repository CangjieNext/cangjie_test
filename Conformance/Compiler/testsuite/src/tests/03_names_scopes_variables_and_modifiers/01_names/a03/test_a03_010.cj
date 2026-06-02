/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_01_a03_010

  @Level:         1

  @Assertion:    3.1(3) A name uniquely represents one entity in any scope. That is, entities in the same
                  scope are not allowed to have the same name, except the names that make up overloading.

  @Description:  Check that entities can have the same name when overloaded

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.*

interface I {
  func f(): Int64
  func f(x: Int64): Int64
  func f(x: Bool): Bool
}

class C <: I {
    public override func f() { return 0xb6 }
    public override func f(x: Int64) { return x*x}
    public override func f(x: Bool) { return !x }
    func f(x: Rune) {return "-" + x.toString() }
}

struct s {
    func f() { return 'f' }
    func f(x: Int64) { return x**2}
    func f(x: Float16) { return x / 6.55 }
    func f(x: Rune) { return "-${x}" }
}

main() {
    func f() { return 0xb6 }
    func f(x: Int64) { return x*x}
    func f(x: Bool) { return !x }
    func f(x: Rune) { return "-" + x.toString()}

    Assert.equals(f(), 0xb6)
    Assert.equals(f(256), 256*256)
    Assert.equals(true, f(false))
    Assert.equals(f(r'>'), "->")

    var classObj = C()

    Assert.equals(classObj.f(), 0xb6)
    Assert.equals(classObj.f(256), 256*256)
    Assert.equals(true, classObj.f(false))
    Assert.equals(classObj.f(r'>'), "->") 

    var structObj = s()

    Assert.equals('f', structObj.f())
    Assert.equals(structObj.f(6), 6**2)
    Assert.equals(structObj.f(Float16(567.0)), Float16(567.0) / 6.55)
    Assert.equals(structObj.f(r'>'), "->") 
}