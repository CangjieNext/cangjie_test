/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_04_a04_01

  @Level:         1

  @Assertion:   2.4(4) For example: 
                    type Point2D = (Float64, Float64)
                    type Point3D = (Float64, Float64, Float64)
                    let point1: Point2D = (0.5, 0.8)
                    let point2: Point3D = (0.5, 0.8, 1.1)
                    The above type definition does not define a new type. It just define another name for an existing
                    type.

  @Description: Check example

  @Mode:        run

  @Negative:    no


*/

import utils.assert.Assert

type Point2D = (Float64, Float64)
type Point3D = (Float64, Float64, Float64)
let point1: Point2D = (0.5, 0.8)
let point2: Point3D = (0.5, 0.8, 1.1)

main(): Unit {
    Assert.isTrue(point1 is Point2D)
    Assert.isTrue(point1 is (Float64, Float64))
    Assert.isTrue(point2 is Point3D)
    Assert.isTrue(point2 is (Float64, Float64, Float64))
}
