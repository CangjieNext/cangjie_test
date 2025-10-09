import std.sync.ReentrantMutex

var res: Float16 = 0.0

main(): Int64 {
  func foo(){
    spawn{res = 0.0}
  
    spawn{
      var a = res
    }
  }
  foo()
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
