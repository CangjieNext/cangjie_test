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
  var b: Array<Int32> = Array<Int32>(100000000) {i => Int32(3 * i)}

  var outterLoopCnt = 10
  var sum : Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] |= b[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 1446914071)
    || (sum[8] != 1346914071)
    || (sum[7] != 1246914071)
    || (sum[6] != 1146914071)
    || (sum[5] != 1046914071)
    || (sum[4] != 946914071)
    || (sum[3] != 846914071)
    || (sum[2] != 746914071)
    || (sum[1] != 646914071)
    || (sum[0] != 546914071)) {
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