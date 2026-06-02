/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a07_01

  @Level:         1

  @Assertion: 4.2(7) Cangjie supports first-class functions (See chapter 5).
  @Description: Checks that functions are first-class citizens, i.e. functions
                can be used as arguments of other functions, and can be used as
                return values to other functions, and can be assigned directly 
                to variables.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var cnt = 0

func empty() {
    cnt++
}

func returnInt(): Int64 {
    cnt++
    Assert.getRuntimeZero()
}

func getFloatReturnInt(f: Float64): Int64 {
    cnt++
    Int64(f)    
}

func generic<T1, T2>(f1: T1, f2: T2): T2 {
    cnt++
    f2
}

func checkEmpty(f: () -> Unit): () -> Unit {
    f()
    f
}

func checkReturnInt(f: () -> Int64): () -> Int64 {
    var i = f()
    Assert.equals(0, i)
    f
}

func checkGetFloatReturnInt(f: (Float64) -> Int64): (Float64) -> Int64 {
    var i = f(3.14)
    Assert.equals(3, i)
    f
}

func checkGeneric(f: ((Int64, Int64) -> Int64)): (Int64, Int64) -> Int64 {
    var i = f(1, 3)
    Assert.equals(3, i)
    f
}

main() {
    var f1: () -> Unit = empty
    var f2 = checkEmpty(empty)
    Assert.isTrue(f2 is () -> Unit)
    f2()

    var f3: () -> Int64 = returnInt
    var f4 = checkReturnInt(returnInt)
    var res4 = f4()
    Assert.isTrue(f4 is () -> Int64)
    Assert.equals(0, res4)


    var f5: (Float64) -> Int64 = getFloatReturnInt
    var f6 = checkGetFloatReturnInt(getFloatReturnInt)
    Assert.isTrue(f6 is (Float64) -> Int64)
    var res6 = f6(0.0)
    Assert.equals(0, res6)    

    var f7: (Int64, Int64) -> Int64 = generic<Int64, Int64> 
    var f8 = checkGeneric(generic<Int64, Int64>)
    Assert.isTrue(f8 is (Int64, Int64) -> Int64)
    var res8 = f8(8, 2)
    Assert.equals(2, res8)    

    Assert.equals(8, cnt)
}
