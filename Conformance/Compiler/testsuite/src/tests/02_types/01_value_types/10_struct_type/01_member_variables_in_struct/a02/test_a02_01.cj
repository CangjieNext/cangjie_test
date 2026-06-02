/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_01_a02_01

  @Level:         1

  @Assertion:   2.1.10.1(2) All member variables defined outside the primary constructor 
                can have an initial value or no initial value. 

  @Description: Checks that the case, when some member variables, defined outside the primary constructor,
                have an initial value, but some other have no initial value, works correctly. 

  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

func myEnumToString(param:MyEnum): String {
    let result: String = match (param) {
        case item1 => "item1";
        case item2 => "item2";
    }

   return result;
}

enum MyEnum {
    item1
    |
    item2

    operator func ==(v: MyEnum) { 
        return (myEnumToString(v) == myEnumToString(this));
    }
}

struct MyStruct {
    public let const1: String = "s1";

    public let const2: Float32;

    public let const3: (Int8, Float64, MyEnum, Rune, String) =
        (1i8, 1.5f64, MyEnum.item1, r'1', "st1");

    public let const4: MyEnum;


    public var var1: String;

    public var var2: Float32 = 1.5f32;

    public var var3: (Int8, Float64, MyEnum, Rune, String);

    public var var4: MyEnum = item1;;

    MyStruct(init1: String, init2: Float32, init3: (Int8, Float64, MyEnum, Rune, String), init4: MyEnum) {
        this.const2 = init2;
        this.const4 = init4;

        this.var1 = init1;
        this.var2 = init2;
        this.var3 = init3;
        this.var4 = init4;
    }
}

main() {
    var myStructVar: MyStruct = MyStruct("s2", 2.5f32, (2i8, 2.5f64, MyEnum.item2, r'2', "st2"), item2);

    // Test case 1
    Assert.equals("s1", myStructVar.const1, 
        reason: "Test case 1 FAILED.");

    // Test case 2
    Assert.equals(2.5, myStructVar.const2, 
        reason: "Test case 2 FAILED.");

    // Test case 3
    var isEquals1 = (1i8, 1.5f64, MyEnum.item1, r'1', "st1") == myStructVar.const3;
    Assert.equals(true, isEquals1, 
        reason: "Test case 3 FAILED.");

    // Test case 4
    Assert.equals(true, item2 == myStructVar.const4, 
        reason: "Test case 4 FAILED.");

    // Test case 5
    Assert.equals("s2", myStructVar.var1, 
        reason: "Test case 5 FAILED.");

    // Test case 6
    Assert.equals(2.5, myStructVar.var2, 
        reason: "Test case 6 FAILED.");

    // Test case 7
    var isEquals2 = (2i8, 2.5f64, MyEnum.item2, r'2', "st2") == myStructVar.var3;
    Assert.equals(true, isEquals2, 
        reason: "Test case 7 FAILED.");

    // Test case 8
    Assert.equals(true, item2 == myStructVar.var4, 
        reason: "Test case 8 FAILED.");

    return 0;
}


