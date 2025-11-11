/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import a.*

extend A{
  func foo1(){

    {
      synchronized(left) {
        synchronized(right) {
          println("left -> right lock.");
        }
      }
    }

    var lock2:Future<Int32> = spawn{
      synchronized(right) {
        synchronized(left) {
          println("right -> left lock.");
        }
      }
      0
    }

    synchronized(right) {
      synchronized(left) {
        synchronized(right) {
        println("right -> left lock.");
      }
      }
    }
    0
  }
}

main(): Int64 {
  0
}
