package a
import std.sync.ReentrantMutex

public var num: Int8 = 0

public func f20(){
  f19()
}

public func f19(){
  f18()
}

public func f18(){
  f17()
}

public func f17(){
  f16()
}

public func f16(){
  f15()
}

public func f15(){
  f14()
}

public func f14(){
  f13()
}

public func f13(){
  f12()
}

public func f12(){
  f11()
}

public func f11(){
  f10()
}

public func f10(){
  f9()
}

public func f9(){
  f8()
}

public func f8(){
  f7()
}

public func f7(){
  f6()
}

public func f6(){
  f5()
}

public func f5(){
  f4()
}

public func f4(){
  f3()
}

public func f3(){
  f2()
}

public func f2(){
  f1()
}

public func f1(){
  num ++
}

public open class Base {
  private static let baseMtx: ReentrantMutex = ReentrantMutex()
  public static func doSomething() {
    synchronized(baseMtx) {

    }
  }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
