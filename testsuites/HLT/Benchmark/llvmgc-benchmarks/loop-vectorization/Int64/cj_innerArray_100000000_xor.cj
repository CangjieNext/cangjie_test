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
      a[i] = b[i] ^ c[i]
    }

    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != 2869361355240855)
    || (sum[8] != 2869361255240855)
    || (sum[7] != 2869361155240855)
    || (sum[6] != 2869361055240855)
    || (sum[5] != 2869360955240855)
    || (sum[4] != 2869360855240855)
    || (sum[3] != 2869360755240855)
    || (sum[2] != 2869360655240855)
    || (sum[1] != 2869360555240855)
    || (sum[0] != 2869360455240855)) {
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