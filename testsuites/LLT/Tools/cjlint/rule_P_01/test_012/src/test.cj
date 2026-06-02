// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import a.*

class B{
  var lock2:Future<Int32> = spawn{
    synchronized(mtx1) {
      synchronized(mtx2) {
        println("seq2.");
      }
    }
    0
  }
  func foo(){
    synchronized(mtx1) {
      synchronized(mtx2) {
        println("seq2.");
      }
    }
  }
}

func foo1(){
  synchronized(mtx2) {
    synchronized(mtx1) {
      println("seq1.");
    }
  }
}

main(): Int64 {
  0
}
