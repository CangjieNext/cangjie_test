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
    func abstractMethod3(): Int32
    func abstractMethod4(): Int32
    func abstractMethod5(): Int32
    func abstractMethod6(): Int32
    func abstractMethod7(): Int32
    func abstractMethod8(): Int32
    func abstractMethod9(): Int32
    func abstractMethod10(): Int32
    func abstractMethod11(): Int32
    func abstractMethod12(): Int32
    func abstractMethod13(): Int32
    func abstractMethod14(): Int32
    func abstractMethod15(): Int32
    func abstractMethod16(): Int32
    func abstractMethod17(): Int32
}

class IfaceTest <: Iface {
    public func abstractMethod(): Int32 {
        return 3
    }
    public func abstractMethod2(): Int32 {
        return 4
    }
    public func abstractMethod3(): Int32 { return 5}
    public func abstractMethod4(): Int32 { return 6}
    public func abstractMethod5(): Int32 { return 7}
    public func abstractMethod6(): Int32 { return 8}
    public func abstractMethod7(): Int32 { return 9}
    public func abstractMethod8(): Int32 { return 10}
    public func abstractMethod9(): Int32 { return 11}
    public func abstractMethod10(): Int32 { return 12}
    public func abstractMethod11(): Int32 { return 13}
    public func abstractMethod12(): Int32 { return 14}
    public func abstractMethod13(): Int32 { return 15}
    public func abstractMethod14(): Int32 { return 16}
    public func abstractMethod15(): Int32 { return 17}
    public func abstractMethod16(): Int32 { return 18}
    public func abstractMethod17(): Int32 { return 19}
}

class IfaceTest2 <: Iface {
    public func abstractMethod(): Int32 {
        return 6
    }
    public func abstractMethod2(): Int32 {
        return 8
    }
    public func abstractMethod3(): Int32 { return 10}
    public func abstractMethod4(): Int32 { return 12}
    public func abstractMethod5(): Int32 { return 14}
    public func abstractMethod6(): Int32 { return 16}
    public func abstractMethod7(): Int32 { return 18}
    public func abstractMethod8(): Int32 { return 20}
    public func abstractMethod9(): Int32 { return 22}
    public func abstractMethod10(): Int32 { return 24}
    public func abstractMethod11(): Int32 { return 26}
    public func abstractMethod12(): Int32 { return 28}
    public func abstractMethod13(): Int32 { return 30}
    public func abstractMethod14(): Int32 { return 32}
    public func abstractMethod15(): Int32 { return 34}
    public func abstractMethod16(): Int32 { return 36}
    public func abstractMethod17(): Int32 { return 38}
}

func ItableTest(ins: Iface) :Int32 {
  return  ins.abstractMethod() + ins.abstractMethod14()
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
      if (res0 != 19 || res1 != 38 || res2 != 110 || res3 !=110) {
        println("failed")
        return 1
      }
    }

    return 0
}
