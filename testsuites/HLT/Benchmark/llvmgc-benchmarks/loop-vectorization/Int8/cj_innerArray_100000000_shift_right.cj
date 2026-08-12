/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int8 {
  var a: Array<Int8> = Array<Int8>(100000000) {i => Int8(2 * i)}
  var outterLoopCnt = 10
  var sum : Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = a[i] >> 3
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -24)
    || (sum[8] != 0)
    || (sum[7] != 0)
    || (sum[6] != 0)
    || (sum[5] != 0)
    || (sum[4] != 0)
    || (sum[3] != 0)
    || (sum[2] != 0)
    || (sum[1] != 0)
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