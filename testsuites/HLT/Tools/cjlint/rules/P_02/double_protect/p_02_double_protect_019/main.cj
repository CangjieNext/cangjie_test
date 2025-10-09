// LEVEL: 1

// EXEC: cjc main.cj
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan-not P.02

import std.sync.*

var m1 = ReentrantMutex()
var m2 = ReentrantMutex()
func temp<T>(){
  func test<T>(){
    spawn {
      var b =  1
      m1.lock()
      b = 2
      m1.unlock()
      m2.lock()
      b = 2
      m2.unlock()
    }
  }
}


main(){}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
