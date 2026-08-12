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

  var outterLoopCnt = 10
  var sum : Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)};
  while (outterLoopCnt > 0) {
    outterLoopCnt--
    for (i in 0.. a.size) {
      a[i] = !a[i]
    }
    
    for (i in 0.. a.size) {
      sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
    }
    println(sum[Int64(outterLoopCnt)])
  }
  println("====")
  if ( (sum[9] != -1999999060000000)
    || (sum[8] != 2000000740000000)
    || (sum[7] != -1999999260000000)
    || (sum[6] != 2000000540000000)
    || (sum[5] != -1999999460000000)
    || (sum[4] != 2000000340000000)
    || (sum[3] != -1999999660000000)
    || (sum[2] != 2000000140000000)
    || (sum[1] != -1999999860000000)
    || (sum[0] != 1999999940000000)) {
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