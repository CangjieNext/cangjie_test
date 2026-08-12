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
  var c: Array<Int16> = Array<Int16>(100000000) {i => Int16(2* i + 3) }
  var outterLoopCnt = 10
  var sum : Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] - c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  if ( (sum[9] != 30176)
    || (sum[8] != -27424)
    || (sum[7] != -19488)
    || (sum[6] != -11552)
    || (sum[5] != -3616)
    || (sum[4] != 4320)
    || (sum[3] != 12256)
    || (sum[2] != 20192)
    || (sum[1] != 28128)
    || (sum[0] != -29472)) {
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