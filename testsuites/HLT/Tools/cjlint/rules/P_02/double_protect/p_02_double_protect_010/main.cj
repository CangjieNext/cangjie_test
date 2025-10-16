// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan P.02

import std.sync.*
var m1 = ReentrantMutex()
var m2 = ReentrantMutex()
class A{
  static var a = 1
  func foo(){
    
    func temp1<T>(){
      spawn {
        m1.lock()
        a = 1
        m1.unlock()
      }
    }

    func temp2<T>(){
      spawn {
        m2.lock()
        a = 1
        m2.unlock()
      }
    }
    temp1<Int64>()
    temp2<Int64>()
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
