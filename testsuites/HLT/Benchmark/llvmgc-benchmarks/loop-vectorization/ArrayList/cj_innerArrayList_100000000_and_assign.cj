/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int32 {
  var a: ArrayList<Int32> = ArrayList<Int32>(100000000) {i => Int32(2 * i)}
  var b: ArrayList<Int32> = ArrayList<Int32>(100000000) {i => Int32(3 * i)}

  var outterLoopCnt = 10
  var sum : ArrayList<Int32> = ArrayList<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] &= b[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 1160565149)
    || (sum[8] != 1060565149)
    || (sum[7] != 960565149)
    || (sum[6] != 860565149)
    || (sum[5] != 760565149)
    || (sum[4] != 660565149)
    || (sum[3] != 560565149)
    || (sum[2] != 460565149)
    || (sum[1] != 360565149)
    || (sum[0] != 260565149)) {
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