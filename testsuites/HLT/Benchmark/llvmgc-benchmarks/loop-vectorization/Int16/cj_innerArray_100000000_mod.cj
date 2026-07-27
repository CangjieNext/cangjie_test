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
      a[i] = b[i] % c[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  if ( (sum[9] != 4655)
    || (sum[8] != 12591)
    || (sum[7] != 20527)
    || (sum[6] != 28463)
    || (sum[5] != -29137)
    || (sum[4] != -21201)
    || (sum[3] != -13265)
    || (sum[2] != -5329)
    || (sum[1] != 2607)
    || (sum[0] != 10543)) {
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