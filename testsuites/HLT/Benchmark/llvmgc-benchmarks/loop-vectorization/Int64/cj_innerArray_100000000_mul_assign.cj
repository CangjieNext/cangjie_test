/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int64 {
  var a: Array<Int64> = Array<Int64>(100000000) {i => Int64(2 * i)}

  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] *= 3
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 6000000800000000)
    || (sum[8] != 18000000580000000)
    || (sum[7] != 54000000120000000)
    || (sum[6] != 161999998940000000)
    || (sum[5] != 485999995600000000)
    || (sum[4] != 1457999985780000000)
    || (sum[3] != 4373999956520000000)
    || (sum[2] != -5324744204769551616)
    || (sum[1] != 2472511458980896768)
    || (sum[0] != 7417534376722690304)) {
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