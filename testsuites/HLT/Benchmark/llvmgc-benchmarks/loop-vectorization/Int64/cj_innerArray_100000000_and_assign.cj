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

  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] &= b[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 1065320553697693)
    || (sum[8] != 1065320453697693)
    || (sum[7] != 1065320353697693)
    || (sum[6] != 1065320253697693)
    || (sum[5] != 1065320153697693)
    || (sum[4] != 1065320053697693)
    || (sum[3] != 1065319953697693)
    || (sum[2] != 1065319853697693)
    || (sum[1] != 1065319753697693)
    || (sum[0] != 1065319653697693)) {
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