/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a05_01

  @Level:         1
  @Assertion:    15.1(5) Each Cangjie program starts with initializing global
                 variables, and it then invokes the entry point main.

  @Description:  Checks that global variables are inited before main

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

let arr:Array<Int64> = Array<Int64>(3){i => 0}
var i = 0

func var1() {
    arr[i] = 1
    i++
    1
}

func var2() {
    arr[i] = 2
    i++
    "Test"
}

let tmp1 = var1()

let test = var2()

main(): Int64 {
    arr[i] = 3

    Assert.equals(1, arr[0], reason: "Init order should be correct 1")
    Assert.equals(2, arr[1], reason: "Init order should be correct 2")
    Assert.equals(3, arr[2], reason: "Init order should be correct 3")
    0
}
