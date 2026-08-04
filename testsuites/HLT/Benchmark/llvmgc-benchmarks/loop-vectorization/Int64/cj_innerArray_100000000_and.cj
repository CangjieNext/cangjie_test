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
  var b: Array<Int64> = Array<Int64>(100000000) {i => Int64(3 * i)}
  var c: Array<Int64> = Array<Int64>(100000000) {i => Int64(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] & c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 1065320617398908)
    || (sum[8] != 1065320517398908)
    || (sum[7] != 1065320417398908)
    || (sum[6] != 1065320317398908)
    || (sum[5] != 1065320217398908)
    || (sum[4] != 1065320117398908)
    || (sum[3] != 1065320017398908)
    || (sum[2] != 1065319917398908)
    || (sum[1] != 1065319817398908)
    || (sum[0] != 1065319717398908)) {
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