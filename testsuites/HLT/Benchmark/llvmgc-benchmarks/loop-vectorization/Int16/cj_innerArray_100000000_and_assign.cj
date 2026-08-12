/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test0() : Int16 {
  var a: Array<Int16> = Array<Int16>(100000000) {i => Int16(2 * i)}
  var b: Array<Int16> = Array<Int16>(100000000) {i => Int16(3 * i)}

  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] &= b[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 19884)
    || (sum[8] != 27820)
    || (sum[7] != -29780)
    || (sum[6] != -21844)
    || (sum[5] != -13908)
    || (sum[4] != -5972)
    || (sum[3] != 1964)
    || (sum[2] != 9900)
    || (sum[1] != 17836)
    || (sum[0] != 25772)) {
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