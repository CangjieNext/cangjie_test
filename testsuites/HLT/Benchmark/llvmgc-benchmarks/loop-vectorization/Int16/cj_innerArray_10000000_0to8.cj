/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000000) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000000) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000000) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -6803)
    || (sum[8] != 20205)
    || (sum[7] != -18323)
    || (sum[6] != 8685)
    || (sum[5] != -29843)
    || (sum[4] != -2835)
    || (sum[3] != 24173)
    || (sum[2] != -14355)
    || (sum[1] != 12653)
    || (sum[0] != -25875)) {
      return 1
  }
  return 0
}

func test1() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000001) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000001) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000001) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -7587)
    || (sum[8] != 19420)
    || (sum[7] != -19109)
    || (sum[6] != 7898)
    || (sum[5] != -30631)
    || (sum[4] != -3624)
    || (sum[3] != 23383)
    || (sum[2] != -15146)
    || (sum[1] != 11861)
    || (sum[0] != -26668)) {
      return 1
  }
  return 0
}
func test2() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000002) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000002) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000002) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -8370)
    || (sum[8] != 18636)
    || (sum[7] != -19894)
    || (sum[6] != 7112)
    || (sum[5] != -31418)
    || (sum[4] != -4412)
    || (sum[3] != 22594)
    || (sum[2] != -15936)
    || (sum[1] != 11070)
    || (sum[0] != -27460)) {
      return 1
  }
  return 0
}
func test3() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000003) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000003) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000003) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -9152)
    || (sum[8] != 17853)
    || (sum[7] != -20678)
    || (sum[6] != 6327)
    || (sum[5] != -32204)
    || (sum[4] != -5199)
    || (sum[3] != 21806)
    || (sum[2] != -16725)
    || (sum[1] != 10280)
    || (sum[0] != -28251)) {
      return 1
  }
  return 0
}
func test4() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000004) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000004) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000004) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -9933)
    || (sum[8] != 17071)
    || (sum[7] != -21461)
    || (sum[6] != 5543)
    || (sum[5] != 32547)
    || (sum[4] != -5985)
    || (sum[3] != 21019)
    || (sum[2] != -17513)
    || (sum[1] != 9491)
    || (sum[0] != -29041)) {
      return 1
  }
  return 0
}
func test5() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000005) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000005) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000005) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -10713)
    || (sum[8] != 16290)
    || (sum[7] != -22243)
    || (sum[6] != 4760)
    || (sum[5] != 31763)
    || (sum[4] != -6770)
    || (sum[3] != 20233)
    || (sum[2] != -18300)
    || (sum[1] != 8703)
    || (sum[0] != -29830)) {
      return 1
  }
  return 0
}
func test6() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000006) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000006) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000006) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -11492)
    || (sum[8] != 15510)
    || (sum[7] != -23024)
    || (sum[6] != 3978)
    || (sum[5] != 30980)
    || (sum[4] != -7554)
    || (sum[3] != 19448)
    || (sum[2] != -19086)
    || (sum[1] != 7916)
    || (sum[0] != -30618)) {
      return 1
  }
  return 0
}
func test7() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000007) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000007) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000007) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -12270)
    || (sum[8] != 14731)
    || (sum[7] != -23804)
    || (sum[6] != 3197)
    || (sum[5] != 30198)
    || (sum[4] != -8337)
    || (sum[3] != 18664)
    || (sum[2] != -19871)
    || (sum[1] != 7130)
    || (sum[0] != -31405)) {
      return 1
  }
  return 0
}

func test8() : Int16 {
  var a: Array<Int16> = Array<Int16>(10000008) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(10000008) {i => Int16(3 * i)}
  var c: Array<Int16> = Array<Int16>(10000008) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -13047)
    || (sum[8] != 13953)
    || (sum[7] != -24583)
    || (sum[6] != 2417)
    || (sum[5] != 29417)
    || (sum[4] != -9119)
    || (sum[3] != 17881)
    || (sum[2] != -20655)
    || (sum[1] != 6345)
    || (sum[0] != -32191)) {
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