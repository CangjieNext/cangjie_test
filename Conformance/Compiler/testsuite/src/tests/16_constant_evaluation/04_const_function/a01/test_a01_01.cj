
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a01_01

  @Level:         1

  @Assertion:   16.4(1) const functions are a special class of functions that have the ability to be evaluated at
                compile time. When such functions are called in a const context, they perform their computation at
                compile time. In other non-const contexts, const functions are executed at runtime just like normal
                functions.
  @Description: Checks that const functions are evaluated at compile time in const contexts and executed at runtime in
                non-const contexts.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614
  @Comment:     Since there is no reliable way to check whether an expression is evaluated at compile time, this test
                compares computation time of identical expressions in const and non-const contexts. However, under some
                circumstances, which depend on the compiler, this test might not work as intended and thus not pass.

*/

import utils.assert.Assert
import std.time.DateTime

const func f4(x: Float64) { x * 0.5 }

const func f3(x: Float64) {
    x ** f4(x) ** f4(1.0/x) ** f4(x) ** f4(1.0/x) ** f4(x) ** f4(1.0/x) ** f4(x) ** f4(1.0/x)
}

const func f2(x: Float64) {
    x ** f3(x) ** f3(1.0/x) ** f3(x) ** f3(1.0/x) ** f3(x) ** f3(1.0/x) ** f3(x) ** f3(1.0/x)
}

const func f1(x: Float64) {
    x ** f2(x) ** f2(1.0/x) ** f2(x) ** f2(1.0/x) ** f2(x) ** f2(1.0/x) ** f2(x) ** f2(1.0/x)
}

const func f(x: Float64) {
    x ** f1(x) ** f1(1.0/x) ** f1(x) ** f1(1.0/x) ** f1(x) ** f1(1.0/x) ** f1(x) ** f1(1.0/x)
}

func cf4(x: Float64) { x * 0.5 }

func cf3(x: Float64) {
    x ** cf4(x) ** cf4(1.0/x) ** cf4(x) ** cf4(1.0/x) ** cf4(x) ** cf4(1.0/x) ** cf4(x) ** cf4(1.0/x)
}

func cf2(x: Float64) {
    x ** cf3(x) ** cf3(1.0/x) ** cf3(x) ** cf3(1.0/x) ** cf3(x) ** cf3(1.0/x) ** cf3(x) ** cf3(1.0/x)
}

func cf1(x: Float64) {
    x ** cf2(x) ** cf2(1.0/x) ** cf2(x) ** cf2(1.0/x) ** cf2(x) ** cf2(1.0/x) ** cf2(x) ** cf2(1.0/x)
}

func cf(x: Float64) {
    x ** cf1(x) ** cf1(1.0/x) ** cf1(x) ** cf1(1.0/x) ** cf1(x) ** cf1(1.0/x) ** cf1(x) ** cf1(1.0/x)
}


main() {
    let t1 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    const a = f(4.0)
    let t2 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    let b = cf(4.0)
    let t3 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    let ratio = Float64(t3 - t2) / Float64(t2 - t1)
    let n = 1000.0
    Assert.isTrue(ratio < n)
}
