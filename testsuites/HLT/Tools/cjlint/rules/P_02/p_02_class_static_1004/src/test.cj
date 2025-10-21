/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

class Demo{
  static var res: Float16 = 0.0
}

class B{
  static func foo(){
    if(true){
      spawn{
        print("${Demo.res}")
      }
    }else{
      spawn{
        print("${Demo.res}")
      }
    }
  }
}

main(): Int64 {
  return 0
}
