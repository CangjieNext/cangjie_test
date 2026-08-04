/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int32 {
  var a: Array<Int32> = Array<Int32>(100000000) {i => Int32(2 * i)}

  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] *= 3
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 206964736)
    || (sum[8] != -1199105792)
    || (sum[7] != -31542047)
    || (sum[6] != 1863484543)
    || (sum[5] != 860622565)
    || (sum[4] != -1950822373)
    || (sum[3] != -739387311)
    || (sum[2] != -1200049432)
    || (sum[1] != 194988232)
    || (sum[0] != 2003004472)) {
      return 1
    }
  return 0
}

main() {
  var result0 = test0()
  if (result0 != 0) {
    return 1
  }
  return 0
}