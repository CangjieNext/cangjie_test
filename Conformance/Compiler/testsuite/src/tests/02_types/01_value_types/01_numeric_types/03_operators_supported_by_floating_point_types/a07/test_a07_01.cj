/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a07_01

  @Level:         1
  @Assertion:       2.1.1.3(7) 0.0 / 0 = NaN floating point number 0.0 is divided by 0

  @Description:     Check that 0 divided by 0 is NaN for Float64/32/16.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006385

*/

import utils.assert.Assert

main() {
    Assert.isTrue((.0 / .0).isNaN())
    Assert.isTrue((-0.0 / .0).isNaN())
    Assert.isTrue((.0 / -0.0).isNaN())
    Assert.isTrue((-0.0 / -0.0).isNaN())

    Assert.isTrue((.0f32 / .0).isNaN())
    Assert.isTrue((-0.0f32 / .0).isNaN())
    Assert.isTrue((.0f32 / -0.0).isNaN())
    Assert.isTrue((-0.0f32 / -0.0).isNaN())

    Assert.isTrue((.0f16 / .0).isNaN())
    Assert.isTrue((-0.0f16 / .0).isNaN())
    Assert.isTrue((.0f16 / -0.0).isNaN())
    Assert.isTrue((-0.0f16 / -0.0).isNaN())
}
