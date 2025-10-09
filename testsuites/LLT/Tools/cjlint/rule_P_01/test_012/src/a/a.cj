// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package a
internal import std.sync.*

public var mtx1: ReentrantMutex = ReentrantMutex()
public var mtx2: ReentrantMutex = ReentrantMutex()

struct A{
  var lock1:Future<Int32> = spawn{
    synchronized(mtx2) {
      synchronized(mtx1) {
        println("seq1.");
      }
    }
    0
  }
}

func foo(){
  synchronized(mtx1) {
    synchronized(mtx2) {
      println("seq2.");
    }
  }
}
