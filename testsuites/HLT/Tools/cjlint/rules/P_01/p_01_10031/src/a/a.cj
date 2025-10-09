package a
import std.sync.ReentrantMutex

public class A{
  public var right: ReentrantMutex = ReentrantMutex()
  public var left: ReentrantMutex = ReentrantMutex()
  func foo(){
    synchronized(left) {
      synchronized(right) {
        println("left -> right lock.");
      }
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
