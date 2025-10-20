import std.sync.ReentrantMutex

var num: Int8 = 0

func f20(){
  f19()
}

func f19(){
  f18()
}

func f18(){
  f17()
}

func f17(){
  f16()
}

func f16(){
  f15()
}

func f15(){
  f14()
}

func f14(){
  f13()
}

func f13(){
  f12()
}

func f12(){
  f11()
}

func f11(){
  f10()
}

func f10(){
  f9()
}

func f9(){
  f8()
}

func f8(){
  f7()
}

func f7(){
  f6()
}

func f6(){
  f5()
}

func f5(){
  f4()
}

func f4(){
  f3()
}

func f3(){
  f2()
}

func f2(){
  f1()
}

func f1(){
  num ++
}

open class Base {
  private static let baseMtx: ReentrantMutex = ReentrantMutex()
  public static func doSomething() {
    synchronized(baseMtx) {

    }
  }
}
class Derived <: Base {
  public redef static func doSomething() {
    f20()
  }
}

main(){0}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
