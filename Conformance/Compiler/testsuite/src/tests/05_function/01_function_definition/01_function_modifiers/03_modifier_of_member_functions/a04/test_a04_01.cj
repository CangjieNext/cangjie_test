/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a04_01

  @Level:         1

  @Assertion:     5.1.1.3(4) The modifiers of the enum member function include public, private, and static. 
                  For details, see Enum Type.

  @Description:   Check that enum memeber function definition may use function modifiers: public, private and static.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

enum Color {
  RED | BLUE | GREEN

  static func myEnumStaticFunc() {
    "myEnumStaticFunc"
  } 

  private func getColorAsString(inVal: Color) {
    match (inVal) {
      case RED => "#FF0000"
      case BLUE => "#0000FF"
      case GREEN => "#00FF00"
    }
  }

  public func getColor() {
    return getColorAsString(this)
  }
    
}

main() {
  Assert.equals("myEnumStaticFunc", Color.myEnumStaticFunc())

  var myRedColor = Color.RED
  Assert.equals("#FF0000", myRedColor.getColor())
}
