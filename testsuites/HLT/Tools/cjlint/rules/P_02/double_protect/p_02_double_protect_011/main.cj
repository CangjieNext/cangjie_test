/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: cjc main.cj  
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan P.02
// ASSERT: scan the same variable is protected by different mutex

import std.sync.*

var m1 = ReentrantMutex()
var m2 = ReentrantMutex()
class B{}
class A<T>{
  static var b =  B()
  func temp1<T>() {
    spawn {
      m1.lock()
      b = B()
      m1.unlock()
    }
  }
  func temp2<T>(){
    spawn {
      m2.lock()
      b = B()
      m2.unlock()
    }
  }
}

main(){}
