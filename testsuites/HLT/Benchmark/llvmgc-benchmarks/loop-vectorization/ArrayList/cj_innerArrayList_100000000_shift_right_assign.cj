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

  var outterLoopCnt = 10
  var sum : ArrayList<Int32> = ArrayList<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] >>= 3
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -606365568)
    || (sum[8] != 567954304)
    || (sum[7] != -1520239360)
    || (sum[6] != -795020544)
    || (sum[5] != 1355622656)
    || (sum[4] != -610460672)
    || (sum[3] != 1203852800)
    || (sum[2] != 274170880)
    || (sum[1] != 100000000)
    || (sum[0] != 0)) {
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