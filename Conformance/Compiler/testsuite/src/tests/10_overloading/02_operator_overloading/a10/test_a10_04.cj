/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a10_04

  @Level:         1

  @Assertion:   10.2(10)  Operator functions can only be defined in class, interface, struct, enum, and extend. 
  
  @Description:  Operator overloading example implementing integer range in enum

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/


import utils.assert.Assert



enum ENUM {
    ZERO | ONE | TWO | THREE | MORE

    public static func enuco(enu:ENUM): Int8 {
        let  this_value = match(enu) {
            case ZERO  => 0i8
            case ONE   => 1i8
            case TWO   => 2i8
            case THREE => 3i8
            case MORE  => -127i8
        }
        return this_value;
    }
    private static func ocune(enu:Int8): ENUM {
        let  this_value = match(enu) {
            case 0i8  => ZERO 
            case 1i8  => ONE  
            case 2i8  => TWO  
            case 3i8  => THREE
            case _    => MORE 
        }
        return this_value;
    }

    public operator func + (Right:ENUM): ENUM {
        var cur : Int8 = enuco(this) + enuco(Right);
        ocune(cur)
    }
}


main(ina :Array<String>) {
    
    var u:ENUM = ONE + TWO
    Assert.equals(3, ENUM.enuco(u))    
    0
}