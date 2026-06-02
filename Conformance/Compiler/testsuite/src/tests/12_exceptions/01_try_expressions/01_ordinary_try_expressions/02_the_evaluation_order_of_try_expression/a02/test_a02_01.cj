/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a02_01

  @Level:         1

  @Assertion:    12.1.1.2(2) - If any return e expression is executed before entering the finally block,
                             then e will be evaluated to a value v and the finally block will be executed immediately;

  @Description:  Checks the finally block will be executed immediately after evaluation of expression value.

  @Mode:         run      

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert
open class C {}

main(ina: Array<String>) {
// test case #1
    func f1() : Float64 {
        try {
            Assert.getRuntimeZero(ina)
            return 1.0
        } catch (_) {
        } finally {}
        Assert.fail()
    }
    let v1 = f1() 
    Assert.equals(1.0, v1)
// test case #2
    func f2() : String {
        try {
            Assert.getRuntimeZero(ina)
            return "bla-bla-bla"
        } catch (_) {
        } finally {}
        Assert.fail()
    }
    let v2 = f2()
    Assert.equals("bla-bla-bla", v2)
// test case #3
    func f3() : C {
        try {
            Assert.getRuntimeZero(ina)
            return C()
        } catch (_) {
        } finally {}
        Assert.fail()
    }
    let v3 = f3()
    Assert.isTrue(v3 is C)
}
