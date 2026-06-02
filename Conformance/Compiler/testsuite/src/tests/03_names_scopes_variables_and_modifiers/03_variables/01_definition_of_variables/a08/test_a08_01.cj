/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a08_01

  @Level:         1

  @Assertion:    3.3.1(8) var is used to define mutable variables.

  @Description:  Check that variable defined as 'var' is mutable.
                 Case: Value of top-level mutable variables can be changed

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myPublicTopVarNotDefinedInitialized = 0
public var myPublicTopVarInt64Initialized: Int64 = 0
public var myPublicTopVarNotDefinedFloat32Initialized = 0.0
public var myPublicTopVarFloat32Initialized: Float32 = 0.1
public var myPublicTopVarCharInitialized: Rune = r'A'
public var myPublicTopVarStringInitialized: String = "AAAA"

var myTopVarNotDefinedInitialized = 0
var myTopVarInt64Initialized: Int64 = 0
var myTopVarNotDefinedButCharInitialized = r'F'
var myTopVarStringInitialized: String = "BBB"
var myTopVarNotDefinedFloat32Initialized = 0.7
var myTopVarFloat32Initialized: Float32 = -0.13

type MyArrItemType = (Int64, Float32, Rune, String, Float64)

func changeValues(a: Int64, b: Float32, c: Rune, d: String, e: Float64){
    myPublicTopVarNotDefinedInitialized = a
    Assert.equals(myPublicTopVarNotDefinedInitialized, a)

    myPublicTopVarInt64Initialized = a
    Assert.equals(myPublicTopVarInt64Initialized, a)

    myPublicTopVarNotDefinedFloat32Initialized = e
    Assert.equals(myPublicTopVarNotDefinedFloat32Initialized, e)

    myPublicTopVarFloat32Initialized = b
    Assert.equals(myPublicTopVarFloat32Initialized, b)

    myPublicTopVarCharInitialized = c
    Assert.equals(myPublicTopVarCharInitialized, c)

    myPublicTopVarStringInitialized = d
    Assert.equals(myPublicTopVarStringInitialized, d)

    myTopVarNotDefinedInitialized = a
    Assert.equals(myTopVarNotDefinedInitialized, a)

    myTopVarInt64Initialized = a
    Assert.equals(myTopVarNotDefinedInitialized, a)

    myTopVarNotDefinedButCharInitialized = c
    Assert.equals(myTopVarNotDefinedButCharInitialized, c)

    myTopVarStringInitialized = d
    Assert.equals(myTopVarStringInitialized, d)

    myTopVarNotDefinedFloat32Initialized = e
    Assert.equals(myTopVarNotDefinedFloat32Initialized, e)

    myTopVarFloat32Initialized = b
    Assert.equals(myTopVarFloat32Initialized, b)
}
main() {
    Assert.equals(0, myPublicTopVarNotDefinedInitialized)
    myPublicTopVarNotDefinedInitialized = 28
    Assert.equals(28, myPublicTopVarNotDefinedInitialized)

    Assert.equals(0, myPublicTopVarInt64Initialized)
    myPublicTopVarInt64Initialized = 34
    Assert.equals(34, myPublicTopVarInt64Initialized)

    Assert.equals(0.0, myPublicTopVarNotDefinedFloat32Initialized)
    myPublicTopVarNotDefinedFloat32Initialized = 37.3
    Assert.equals(37.3, myPublicTopVarNotDefinedFloat32Initialized)

    Assert.equals(0.1, myPublicTopVarFloat32Initialized)
    myPublicTopVarFloat32Initialized = -97.15
    Assert.equals(-97.15, myPublicTopVarFloat32Initialized)

    Assert.equals(r'A', myPublicTopVarCharInitialized)
    myPublicTopVarCharInitialized = r'F'
    Assert.equals(r'F', myPublicTopVarCharInitialized)

    Assert.equals("AAAA", myPublicTopVarStringInitialized)
    myPublicTopVarStringInitialized = "BBBB"
    Assert.equals("BBBB", myPublicTopVarStringInitialized)

    Assert.equals(0, myTopVarNotDefinedInitialized)
    myTopVarNotDefinedInitialized = -5
    Assert.equals(-5, myTopVarNotDefinedInitialized)

    Assert.equals(0, myTopVarInt64Initialized)
    myTopVarInt64Initialized = -256
    Assert.equals(-256, myTopVarInt64Initialized)

    Assert.equals(r'F', myTopVarNotDefinedButCharInitialized)
    myTopVarNotDefinedButCharInitialized = r'G'
    Assert.equals(r'G', myTopVarNotDefinedButCharInitialized)

    Assert.equals("BBB", myTopVarStringInitialized)
    myTopVarStringInitialized = "GTR"
    Assert.equals("GTR", myTopVarStringInitialized)

    Assert.equals(0.7, myTopVarNotDefinedFloat32Initialized)
    myTopVarNotDefinedFloat32Initialized = 37.3
    Assert.equals(37.3, myTopVarNotDefinedFloat32Initialized)

    Assert.equals(-0.13, myTopVarFloat32Initialized)
    myTopVarFloat32Initialized = 12.13
    Assert.equals(12.13, myTopVarFloat32Initialized)

    changeValues(16, 0.15, r'A', "DEF", -18.37)

    let myArr: Array<MyArrItemType> = [
        (28, 0.0, r'H', "asdgas", -1.888),
        (64, -5.45, r'P', "weryery", 22.073),
        (-5, 7.22, r'Q', "PPJJ", 168.7),
        (22, 3.14, r'v', "WWEWR", -0.73),
        (1793, -0.5, r'T', "U9023T)", 7.62),
        (0, 0.1, r'm', "J+555", 8.7)
    ]

    for(item in myArr) {
        changeValues(item[0], item[1], item[2], item[3], item[4])
    }
}