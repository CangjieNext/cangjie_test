// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan-not P.02

import std.sync.*
var m1 = ReentrantMutex()
var m2 = ReentrantMutex()
class B{
  func temp1(){}
  func temp2(){}
}
  
func temp0() {
  let a = B()
  let b = a.temp2()
  func temp1<T>(){
    spawn {
      m1.lock()
      b
      m1.unlock()
    }
  }
  func temp2<T>(){
    spawn {
      m2.lock()
      b
      m2.unlock()
    }
  }
}




main(){
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
