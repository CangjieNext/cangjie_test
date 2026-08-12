/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*
import std.convert.*
import std.convert.*


var n = 0

public abstract class Base {
  public func getA(i : Int64) :Int64
  public func getB(i : Int64) :Int64
}

open public class Derived1 <:Base {
  open public func getA(i : Int64) :Int64 {
    return 1 + i
  }
  open public func getB(i : Int64) :Int64 {
    return 2 + i
  }
}


open public class Derived2 <:Base {
  open public func getA(i : Int64) :Int64 {
    return 3 + i
  }
  open public func getB(i : Int64) :Int64 {
    return 4 + i
  }
}

public func GetASum(input : Base) {
  var sum: Int64 = 0
  for (i in 0..n) {
    sum += input.getA(i)
  }
  return sum
}

public func GetBSum(input : Base) {
  var sum: Int64 = 0
  for (i in 0..n) {
    sum += input.getB(i)
  }
  return sum
}

func test0() : Int64 {
  var test1 = Derived1()
  var test2 = Derived2()
  var sum1 = GetASum(test1)
  var sum2 = GetASum(test2)
  var sum3 = GetBSum(test1)
  var sum4 = GetBSum(test2)
  if (n == 100000000 && (sum1 != 5000000050000000 || sum2 != 5000000250000000 || sum3 != 5000000150000000 || sum4 != 5000000350000000)) {
    return 1
  }
  return 0
}

main(args: Array<String>) {
  if (args.size > 0) {
    n = Int64.tryParse(args[args.size-1])??Int64(100000000)
  } else {
    n = 100000000
  }

  var result0 = test0()
  if (result0 != 0) {
    return 1
  }
  return 0
}
