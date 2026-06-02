/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a07_02

  @Level:         1

  @Assertion:    13.1.3.4(7) When the argument is passed, it is still of type CPointer<T> .

  @Description:  Checks inout behavior for VArray argument to foreign function.

  @Comment:      This assertion refines properties of VArray argument in CFunc invocation,
                see previous assertion for context.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077


*/

import utils.assert.Assert

foreign func func_01(buf: CPointer<UInt8>): Unit

@C
struct Point2D {
    var x: Float32
    var y: Float32
    init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }
}
foreign func invert(start: CPointer<Point2D>): Unit

main() {
    var arr = VArray<UInt8, $10> { i => UInt8(i)}
    unsafe { func_01(inout arr) }
    for (i in 0..10) {
        Assert.equals(UInt8(i+10), arr[i])
    }

    var a2:VArray<Point2D, $2> = [Point2D(1.0, 2.0), Point2D(12.0, 456.5) ]
    unsafe{ invert(inout a2) }
    Assert.equals(-1.0, a2[0].x)
    Assert.equals(-2.0, a2[0].y)
    Assert.equals(-12.0, a2[1].x)
    Assert.equals(-456.5, a2[1].y)
}
