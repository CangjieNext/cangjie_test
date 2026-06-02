/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a04_01

  @Level:         1

  @Assertion:    3.2.3.2(4) A variable must be defined and initialized before being used.

  @Description:  Checks that defined and initialized variable does not cause compilation errors.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class Point {
    var x: Int32 = 1
    var y: Int32 = 2
    init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}

main() {
// test case #1
    let tmp1 : Int32 = 0
    var vv1 = tmp1
    Assert.equals(0, vv1)

// test case #2
    let tmp2 : Int64 = 0
    if (tmp2 == 0) {
        var vv2 = tmp2 
        Assert.equals(0, vv2)
    }

// test case #3
    func myBoolFunc(i: Int64){
        if(i > 0){
            return false
        }
        return true
    }
    let tmp3 : Float32 = 0.0
    if (myBoolFunc(tmp2)) {
    } else {
        var vv3 = tmp3 
        Assert.equals(0.0, vv3)
    }

// test case #4
    let tmp4 : Float64 = 0.0
    if (myBoolFunc(tmp2)) {
    } else {
        var vv4 = tmp4 
        Assert.equals(0.0, vv4)
    }

// test case #5
    let tmp5 : String = ""
    func foo5() { var vv5 = tmp5; Assert.equals("", vv5) }
    foo5()

// test case #6
    var tmp6 : Int64 = 0
    let ss6 : String = match (0) {
        case 1 => "one"
        case 2 => "two"
        case 0 => "zero"
        case _ => "invalid"
    }
    if (ss6 == "zero") {
        tmp6 = -1
    }
    Assert.equals(-1, tmp6)
 
// test case #7
    var tmp7 : Int64 = -1
    let ss7 = "${tmp7}"
    Assert.equals("-1", ss7)

// test case #8
    var xx10 = 1; let yy10 = 2
    func foo10<T>(x : T, y : T) : T { return y }
    let z : Int64 = foo10<Int64>(xx10, yy10)
    Assert.equals(2, z)

// test case #9
    let xx11 : Int32 = 5
    let yy11 : Int32 = 6
    let point = Point(xx11, yy11)
    Assert.equals(5, point.x)
    Assert.equals(6, point.y)

// test case #10
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    for (item in intArray) {
        let s : String = "${item}"
    }

// test case #11
    var tmp13 = 0
    while (tmp13 < 1) {
        tmp13++
    }
    Assert.equals(1, tmp13)

// test case #12
    var tmp14 = 0
    do {
        tmp14++
    } while (tmp14 < 1)
    Assert.equals(1, tmp14)
}


