/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000000) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000000) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000000) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 31)
    || (sum[8] != -97)
    || (sum[7] != 31)
    || (sum[6] != -97)
    || (sum[5] != 31)
    || (sum[4] != -97)
    || (sum[3] != 31)
    || (sum[2] != -97)
    || (sum[1] != 31)
    || (sum[0] != -97)) {
      return 1
  }
  return 0
}

func test1() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000001) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000001) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000001) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 15)
    || (sum[8] != -114)
    || (sum[7] != 13)
    || (sum[6] != -116)
    || (sum[5] != 11)
    || (sum[4] != -118)
    || (sum[3] != 9)
    || (sum[2] != -120)
    || (sum[1] != 7)
    || (sum[0] != -122)) {
      return 1
  }
  return 0
}
func test2() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000002) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000002) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000002) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 0)
    || (sum[8] != 126)
    || (sum[7] != -4)
    || (sum[6] != 122)
    || (sum[5] != -8)
    || (sum[4] != 118)
    || (sum[3] != -12)
    || (sum[2] != 114)
    || (sum[1] != -16)
    || (sum[0] != 110)) {
      return 1
  }
  return 0
}
func test3() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000003) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000003) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000003) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -14)
    || (sum[8] != 111)
    || (sum[7] != -20)
    || (sum[6] != 105)
    || (sum[5] != -26)
    || (sum[4] != 99)
    || (sum[3] != -32)
    || (sum[2] != 93)
    || (sum[1] != -38)
    || (sum[0] != 87)) {
      return 1
  }
  return 0
}
func test4() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000004) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000004) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000004) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -27)
    || (sum[8] != 97)
    || (sum[7] != -35)
    || (sum[6] != 89)
    || (sum[5] != -43)
    || (sum[4] != 81)
    || (sum[3] != -51)
    || (sum[2] != 73)
    || (sum[1] != -59)
    || (sum[0] != 65)) {
      return 1
  }
  return 0
}
func test5() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000005) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000005) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000005) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -39)
    || (sum[8] != 84)
    || (sum[7] != -49)
    || (sum[6] != 74)
    || (sum[5] != -59)
    || (sum[4] != 64)
    || (sum[3] != -69)
    || (sum[2] != 54)
    || (sum[1] != -79)
    || (sum[0] != 44)) {
      return 1
  }
  return 0
}
func test6() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000006) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000006) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000006) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -50)
    || (sum[8] != 72)
    || (sum[7] != -62)
    || (sum[6] != 60)
    || (sum[5] != -74)
    || (sum[4] != 48)
    || (sum[3] != -86)
    || (sum[2] != 36)
    || (sum[1] != -98)
    || (sum[0] != 24)) {
      return 1
  }
  return 0
}
func test7() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000007) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000007) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000007) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -60)
    || (sum[8] != 61)
    || (sum[7] != -74)
    || (sum[6] != 47)
    || (sum[5] != -88)
    || (sum[4] != 33)
    || (sum[3] != -102)
    || (sum[2] != 19)
    || (sum[1] != -116)
    || (sum[0] != 5)) {
      return 1
  }
  return 0
}

func test8() : Int8 {
  var a: Array<Int8> = Array<Int8>(10000008) {i => Int8(2 * i)}
  var b: Array<Int8> = Array<Int8>(10000008) {i => Int8(3 * i)}
  var c: Array<Int8> = Array<Int8>(10000008) {i => Int8(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -69)
    || (sum[8] != 51)
    || (sum[7] != -85)
    || (sum[6] != 35)
    || (sum[5] != -101)
    || (sum[4] != 19)
    || (sum[3] != -117)
    || (sum[2] != 3)
    || (sum[1] != 123)
    || (sum[0] != -13)) {
      return 1
  }
  return 0
}


main() {
  if (test0() != 0) {
    return 1
  }
  if (test1() != 0) {
    return 1
  }
  if (test2() != 0) {
    return 1
  }
  if (test3() != 0) {
    return 1
  }
  if (test4() != 0) {
    return 1
  }
  if (test5() != 0) {
    return 1
  }
  if (test6() != 0) {
    return 1
  }
  if (test7() != 0) {
    return 1
  }
  if (test8() != 0) {
    return 1
  }
  return 0
}