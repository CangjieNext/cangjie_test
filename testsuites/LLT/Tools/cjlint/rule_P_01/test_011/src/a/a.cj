// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package a
internal import std.sync.*

public class A{
  public var mtx1: ReentrantMutex = ReentrantMutex()
  public var mtx2: ReentrantMutex = ReentrantMutex()
  func foo(){
    synchronized(mtx2) {
      synchronized(mtx1) {
        println("seq1.");
      }
    }
  }
}
