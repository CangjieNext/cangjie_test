/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan-not P.02

import std.sync.*
var m1 = ReentrantMutex()
var m2 = ReentrantMutex()
class A{}

func temp(){
  let a = A()
  func temp1(){
    spawn {
      m1.lock()
      a = A()
      m1.unlock()
    }
    spawn {
      m2.lock()
      a = A()
      m2.unlock()
    }
  }
}


main(){
}
