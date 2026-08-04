/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000000) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000000) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000000) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1924260032)
    || (sum[8] != -1934260032)
    || (sum[7] != -1944260032)
    || (sum[6] != -1954260032)
    || (sum[5] != -1964260032)
    || (sum[4] != -1974260032)
    || (sum[3] != -1984260032)
    || (sum[2] != -1994260032)
    || (sum[1] != -2004260032)
    || (sum[0] != -2014260032)) {
      return 1
    }
  return 0
}

func test1() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000001) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000001) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000001) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1914260023)
    || (sum[8] != -1924260024)
    || (sum[7] != -1934260025)
    || (sum[6] != -1944260026)
    || (sum[5] != -1954260027)
    || (sum[4] != -1964260028)
    || (sum[3] != -1974260029)
    || (sum[2] != -1984260030)
    || (sum[1] != -1994260031)
    || (sum[0] != -2004260032)) {
      return 1
    }
  return 0
}
func test2() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000002) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000002) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000002) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1904260013)
    || (sum[8] != -1914260015)
    || (sum[7] != -1924260017)
    || (sum[6] != -1934260019)
    || (sum[5] != -1944260021)
    || (sum[4] != -1954260023)
    || (sum[3] != -1964260025)
    || (sum[2] != -1974260027)
    || (sum[1] != -1984260029)
    || (sum[0] != -1994260031)) {
      return 1
    }
  return 0
}
func test3() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000003) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000003) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000003) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1894260002)
    || (sum[8] != -1904260005)
    || (sum[7] != -1914260008)
    || (sum[6] != -1924260011)
    || (sum[5] != -1934260014)
    || (sum[4] != -1944260017)
    || (sum[3] != -1954260020)
    || (sum[2] != -1964260023)
    || (sum[1] != -1974260026)
    || (sum[0] != -1984260029)) {
      return 1
    }
  return 0
}
func test4() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000004) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000004) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000004) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1884259990)
    || (sum[8] != -1894259994)
    || (sum[7] != -1904259998)
    || (sum[6] != -1914260002)
    || (sum[5] != -1924260006)
    || (sum[4] != -1934260010)
    || (sum[3] != -1944260014)
    || (sum[2] != -1954260018)
    || (sum[1] != -1964260022)
    || (sum[0] != -1974260026)) {
      return 1
    }
  return 0
}
func test5() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000005) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000005) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000005) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1874259977)
    || (sum[8] != -1884259982)
    || (sum[7] != -1894259987)
    || (sum[6] != -1904259992)
    || (sum[5] != -1914259997)
    || (sum[4] != -1924260002)
    || (sum[3] != -1934260007)
    || (sum[2] != -1944260012)
    || (sum[1] != -1954260017)
    || (sum[0] != -1964260022)) {
      return 1
    }
  return 0
}
func test6() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000006) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000006) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000006) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1864259963)
    || (sum[8] != -1874259969)
    || (sum[7] != -1884259975)
    || (sum[6] != -1894259981)
    || (sum[5] != -1904259987)
    || (sum[4] != -1914259993)
    || (sum[3] != -1924259999)
    || (sum[2] != -1934260005)
    || (sum[1] != -1944260011)
    || (sum[0] != -1954260017)) {
      return 1
    }
  return 0
}
func test7() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000007) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000007) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000007) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1854259948)
    || (sum[8] != -1864259955)
    || (sum[7] != -1874259962)
    || (sum[6] != -1884259969)
    || (sum[5] != -1894259976)
    || (sum[4] != -1904259983)
    || (sum[3] != -1914259990)
    || (sum[2] != -1924259997)
    || (sum[1] != -1934260004)
    || (sum[0] != -1944260011)) {
      return 1
    }
  return 0
}

func test8() : Int32 {
  var a: Array<Int32> = Array<Int32>(10000008) {i => Int32(2 * i)}
  var b: Array<Int32> = Array<Int32>(10000008) {i => Int32(3 * i)}
  var c: Array<Int32> = Array<Int32>(10000008) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] + c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1844259932)
    || (sum[8] != -1854259940)
    || (sum[7] != -1864259948)
    || (sum[6] != -1874259956)
    || (sum[5] != -1884259964)
    || (sum[4] != -1894259972)
    || (sum[3] != -1904259980)
    || (sum[2] != -1914259988)
    || (sum[1] != -1924259996)
    || (sum[0] != -1934260004)) {
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