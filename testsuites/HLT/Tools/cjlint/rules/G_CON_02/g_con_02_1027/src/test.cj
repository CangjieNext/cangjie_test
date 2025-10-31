/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

class A{}
let mtx: ReentrantMutex = ReentrantMutex()

extend A{
  static func foo(){
    spawn{
        try {
            mtx.lock()
        } catch (_) {
            mtx.unlock()
        }
    }

    try {
            mtx.lock()
    } catch (_) {
    }

    spawn{
      spawn{
        try {
            mtx.lock()
        } catch (_) {
        }
      }
    }
    return 0
  }
}

main(){
  return A.foo()
}


