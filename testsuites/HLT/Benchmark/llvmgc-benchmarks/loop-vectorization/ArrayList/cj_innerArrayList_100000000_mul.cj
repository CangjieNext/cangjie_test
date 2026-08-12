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
  var b: ArrayList<Int32> = ArrayList<Int32>(100000000) {i => Int32(3 * i)}
  var c: ArrayList<Int32> = ArrayList<Int32>(100000000) {i => Int32(2* i + 3) }
  var outterLoopCnt = 10
  var sum : ArrayList<Int32> = ArrayList<Int32>(outterLoopCnt) {i => Int32(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = b[i] * c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  if ( (sum[9] != 754940092)
    || (sum[8] != 654940092)
    || (sum[7] != 554940092)
    || (sum[6] != 454940092)
    || (sum[5] != 354940092)
    || (sum[4] != 254940092)
    || (sum[3] != 154940092)
    || (sum[2] != 54940092)
    || (sum[1] != -45059908)
    || (sum[0] != -145059908)) {
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