
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a02_02

  @Level:         1

  @Assertion: 4.1(2) For collective literals and tuple literals (see Value
              Types), whose value is the value of the literal obtained by 
              evaluating all expressions within it, and whose type is 
              determined by its syntax.
  @Description: Checks value and type of the tuples. Tests float literals.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var t1 = (0, 3.14, 3.14f16, 3.14f32, 3.14f64)
    Assert.isTrue(t1 is (Int64, Float64, Float16, Float32, Float64))
    if( (Assert.getRuntimeZero(), 3.14, 3.14f16, 3.14f32, 3.14f64) != t1) {
        Assert.fail(reason: "Should be equal.")
    }

    var t2 = (0, .14, .14f16, .14f32, .14f64)
    Assert.isTrue(t2 is (Int64, Float64, Float16, Float32, Float64))
    if( (Assert.getRuntimeZero(), .14, .14f16, .14f32, .14f64) != t2) {
        Assert.fail(reason: "Should be equal.")
    }

    var t3 = (0, 2.002e4f16, 2.002e4f32, 2.002e4f64, 2.002e4)
    Assert.isTrue(t3 is (Int64, Float16, Float32, Float64, Float64))
    if( (Assert.getRuntimeZero(), 
            2.002E4f16, 
            2.002E4f32, 
            2.002E4f64, 
            2.002E4) != t3) {
        Assert.fail(reason: "Should be equal.")
    }

    var t4 = (0, 2.002e-4f16, 2.002e-4f32, 2.002e-4f64, 2.002e-4)
    Assert.isTrue(t4 is (Int64, Float16, Float32, Float64, Float64))
    if( (Assert.getRuntimeZero(), 
            2.002E-4f16, 
            2.002E-4f32, 
            2.002E-4f64, 
            2.002E-4) != t4) {
        Assert.fail(reason: "Should be equal.")
    }
}