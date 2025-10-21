/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import a.*

class B{
  var lock2:Future<Int32> = spawn{
    synchronized(right) {
      synchronized(left) {
        println("right -> left lock.");
      }
    }
    0
  }
  func foo(){
    synchronized(right) {
      synchronized(left) {
        println("right -> left lock.");
      }
    }
  }
}

func foo1(){
  synchronized(left) {
    synchronized(right) {
      println("right -> left lock.");
    }
  }
}

main(): Int64 {
  0
}
