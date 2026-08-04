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

interface Iface {
    func abstractMethod(): Int32
    func abstractMethod2(): Int32
}

class IfaceTest <: Iface {
    public func abstractMethod(): Int32 {
        return 3
    }
    public func abstractMethod2(): Int32 {
        return 4
    }
}

class IfaceTest2 <: Iface {
    public func abstractMethod(): Int32 {
        return 6
    }
    public func abstractMethod2(): Int32 {
        return 8
    }
}

func ItableTest(ins: Iface) :Int32 {
  return  ins.abstractMethod() + ins.abstractMethod2()
}


func ItableTest2(ins1: Iface, ins2 : Iface) :Int32 {
  return  (ins1.abstractMethod() + ins2.abstractMethod2()) * (ins2.abstractMethod() + ins1.abstractMethod2())
}

main(args: Array<String>): Int64 {
    if (args.size > 0) {
      n = Int64.tryParse(args[args.size-1])??Int64(100000000)
    } else {
      n = 100000000
    }

    var test1 = IfaceTest()
    var test2 = IfaceTest2()
    for (i in 0 ..n) {
      let res0 = ItableTest(test1)
      let res1 = ItableTest(test2)
      let res2 = ItableTest2(test1, test2)
      let res3 = ItableTest2(test2, test1)
      if (res0 != 7 || res1 != 14 || res2 != 110 || res3 !=110) {
        println("failed")
        return 1
      }
    }

    return 0
}
