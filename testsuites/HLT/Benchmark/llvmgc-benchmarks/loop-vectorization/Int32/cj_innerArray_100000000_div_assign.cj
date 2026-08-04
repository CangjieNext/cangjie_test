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
      a[i] /= 3
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1605319082)
    || (sum[8] != 1363216074)
    || (sum[7] != -577250400)
    || (sum[6] != 140916544)
    || (sum[5] != 1745294624)
    || (sum[4] != -649890699)
    || (sum[3] != -83296708)
    || (sum[2] != 38902920)
    || (sum[1] != -1418684672)
    || (sum[0] != -539545155)) {
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