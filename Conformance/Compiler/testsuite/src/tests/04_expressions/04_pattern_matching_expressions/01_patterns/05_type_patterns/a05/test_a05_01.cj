/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a05_01

  @Level:         1

  @Assertion: 4.4.1.5(5) Examples of type pattern is shown below.
              open class Point {
                  var x: Int32 = 1
                  var y: Int32 = 2
                  init(x: Int32, y: Int32) {
                      this.x = x
                      this.y = y
                  }
              }
              class ColoredPoint <: Point {
                  var color: String = "green"
                  init(x: Int32, y: Int32, color: String) {
                      super(x, y)
                      this.color = color
                  }
              }
              let normalPt = Point(5,10)
              let colorPt = ColoredPoint(8,24,"red")
              var rectangleArea1: Int32 = match (normalPt) {
                  case _: Point => normalPt.x * normalPt.y // matched
                  case _ => 0
              }
              var rectangleArea2: Int32 = match (colorPt) {
                  case cpt: Point => cpt.x * cpt.y // matched
                  case _ => 0
              }

@Description: Check that the Spec example works.
@Mode: run
@Negative: no
@Structure: single
@CompileWarning: no
*/

import utils.assert.Assert

open class Point {
    var x: Int32 = 1
    var y: Int32 = 2
    init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}
class ColoredPoint <: Point {
    var color: String = "green"
    init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
}

main() {
    let normalPt = Point(5,10)
    let colorPt = ColoredPoint(8,24,"red")
    var rectangleArea1: Int32 = match (normalPt) {
        case _: Point => normalPt.x * normalPt.y // matched
        case _ => 0
    }
    var rectangleArea2: Int32 = match (colorPt) {
        case cpt: Point => cpt.x * cpt.y // matched
        case _ => 0
    }

    Assert.equals(50, rectangleArea1)
    Assert.equals(192, rectangleArea2)
    return
}
