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
      a[i] = b[i] + c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  if ( (sum[9] != 5000000850000000)
    || (sum[8] != 5000000750000000)
    || (sum[7] != 5000000650000000)
    || (sum[6] != 5000000550000000)
    || (sum[5] != 5000000450000000)
    || (sum[4] != 5000000350000000)
    || (sum[3] != 5000000250000000)
    || (sum[2] != 5000000150000000)
    || (sum[1] != 5000000050000000)
    || (sum[0] != 4999999950000000)) {
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