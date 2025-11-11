/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Test{
  public static var lock1: ReentrantMutex = ReentrantMutex()
  public static var lock2: ReentrantMutex = ReentrantMutex()
  public var lock3: ReentrantMutex = ReentrantMutex()
  public var lock4: ReentrantMutex = ReentrantMutex()
  public static var lock5: ReentrantMutex = ReentrantMutex()
}

var l1 = Test.lock1
var l2 = Test.lock2
var l3 = Test().lock3
var l4 = Test().lock4
var l5 = Test.lock5

func foo1(a!:Unit = synchronized(l1){synchronized(l2){}},b!:Unit = synchronized(l2) {synchronized(l1) {}}){
}

func foo2(a!:Unit = synchronized(l2){synchronized(l4){synchronized(l1){}}},b!:Unit = synchronized(l5) {synchronized(l2) {synchronized(l3){}}}){
}

func foo3(a!:Unit = synchronized(l3){synchronized(l5){synchronized(l2){synchronized(l4){}}}},b!:Unit = synchronized(l1) {synchronized(l3){synchronized(l2){synchronized(l5){}}}}){
}

func foo4(a!:Unit = synchronized(l1){synchronized(l2){synchronized(l3){synchronized(l4){synchronized(l5){}}}}},b!:Unit = synchronized(l3) {synchronized(l1){synchronized(l5){synchronized(l4){synchronized(l2){}}}}}){
}

main(): Int64 {
  for (i in 0..10) {
    spawn {
      foo1()
      foo2()
      foo3()
      foo4()
    }
  }
  0
}
