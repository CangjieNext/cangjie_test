/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000000) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000000) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000000) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000085000000)
    || (sum[8] != 50000075000000)
    || (sum[7] != 50000065000000)
    || (sum[6] != 50000055000000)
    || (sum[5] != 50000045000000)
    || (sum[4] != 50000035000000)
    || (sum[3] != 50000025000000)
    || (sum[2] != 50000015000000)
    || (sum[1] != 50000005000000)
    || (sum[0] != 49999995000000)) {
      return 1
  }
  return 0
}

func test1() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000001) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000001) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000001) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000095000009)
    || (sum[8] != 50000085000008)
    || (sum[7] != 50000075000007)
    || (sum[6] != 50000065000006)
    || (sum[5] != 50000055000005)
    || (sum[4] != 50000045000004)
    || (sum[3] != 50000035000003)
    || (sum[2] != 50000025000002)
    || (sum[1] != 50000015000001)
    || (sum[0] != 50000005000000)) {
      return 1
  }
  return 0
}
func test2() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000002) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000002) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000002) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000105000019)
    || (sum[8] != 50000095000017)
    || (sum[7] != 50000085000015)
    || (sum[6] != 50000075000013)
    || (sum[5] != 50000065000011)
    || (sum[4] != 50000055000009)
    || (sum[3] != 50000045000007)
    || (sum[2] != 50000035000005)
    || (sum[1] != 50000025000003)
    || (sum[0] != 50000015000001)) {
      return 1
  }
  return 0
}
func test3() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000003) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000003) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000003) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000115000030)
    || (sum[8] != 50000105000027)
    || (sum[7] != 50000095000024)
    || (sum[6] != 50000085000021)
    || (sum[5] != 50000075000018)
    || (sum[4] != 50000065000015)
    || (sum[3] != 50000055000012)
    || (sum[2] != 50000045000009)
    || (sum[1] != 50000035000006)
    || (sum[0] != 50000025000003)) {
      return 1
  }
  return 0
}
func test4() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000004) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000004) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000004) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000125000042)
    || (sum[8] != 50000115000038)
    || (sum[7] != 50000105000034)
    || (sum[6] != 50000095000030)
    || (sum[5] != 50000085000026)
    || (sum[4] != 50000075000022)
    || (sum[3] != 50000065000018)
    || (sum[2] != 50000055000014)
    || (sum[1] != 50000045000010)
    || (sum[0] != 50000035000006)) {
      return 1
  }
  return 0
}
func test5() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000005) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000005) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000005) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000135000055)
    || (sum[8] != 50000125000050)
    || (sum[7] != 50000115000045)
    || (sum[6] != 50000105000040)
    || (sum[5] != 50000095000035)
    || (sum[4] != 50000085000030)
    || (sum[3] != 50000075000025)
    || (sum[2] != 50000065000020)
    || (sum[1] != 50000055000015)
    || (sum[0] != 50000045000010)) {
      return 1
  }
  return 0
}
func test6() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000006) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000006) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000006) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000145000069)
    || (sum[8] != 50000135000063)
    || (sum[7] != 50000125000057)
    || (sum[6] != 50000115000051)
    || (sum[5] != 50000105000045)
    || (sum[4] != 50000095000039)
    || (sum[3] != 50000085000033)
    || (sum[2] != 50000075000027)
    || (sum[1] != 50000065000021)
    || (sum[0] != 50000055000015)) {
      return 1
  }
  return 0
}
func test7() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000007) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000007) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000007) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000155000084)
    || (sum[8] != 50000145000077)
    || (sum[7] != 50000135000070)
    || (sum[6] != 50000125000063)
    || (sum[5] != 50000115000056)
    || (sum[4] != 50000105000049)
    || (sum[3] != 50000095000042)
    || (sum[2] != 50000085000035)
    || (sum[1] != 50000075000028)
    || (sum[0] != 50000065000021)) {
      return 1
  }
  return 0
}

func test8() : Int64 {
  var a: Array<Int64> = Array<Int64>(10000008) {i => Int64(2 * i)}
  var b: Array<Int64> = Array<Int64>(10000008) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(10000008) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 50000165000100)
    || (sum[8] != 50000155000092)
    || (sum[7] != 50000145000084)
    || (sum[6] != 50000135000076)
    || (sum[5] != 50000125000068)
    || (sum[4] != 50000115000060)
    || (sum[3] != 50000105000052)
    || (sum[2] != 50000095000044)
    || (sum[1] != 50000085000036)
    || (sum[0] != 50000075000028)) {
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