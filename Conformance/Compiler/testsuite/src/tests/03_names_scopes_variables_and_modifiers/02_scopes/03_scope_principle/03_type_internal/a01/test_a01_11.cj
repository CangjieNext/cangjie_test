/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a01_11

  @Level:         1

  @Assertion:    3.2.3.3(1) The scope of classes/interface/struct’s members is the entire class/interface/struct
                  definition.

  @Description:  Check that interface members can be accessible interface definition.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

interface I {
    func sayHello(p: String): String { "Hello ${p}" }
    func add(p1: Int64, p2: Int64): Int64 { p1 + p2}
    func logicalAnd(p1: Bool, p2: Bool): Bool { p1 && p2}

    func sayHelloWorld(): String { sayHello("World") }
    func addOne(p: Int64) {add(p, 1)}
    func logicalAndTrue(p1: Bool): Bool {logicalAnd(p1, true)}

    func logicalAndTrueFalse(): Bool {logicalAndTrue(false)}
}

class C <: I {}

main() {
    var obj = C()
    Assert.equals("Hello World", obj.sayHelloWorld())
    Assert.equals(2023, obj.addOne(2022))
    Assert.equals(false, obj.logicalAndTrueFalse())
}
