import std.sync.*

struct A{
  let mtx: ReentrantMutex = ReentrantMutex()
  func foo(){
    mtx.lock()
    spawn{
        try {
            // code
        } catch (_) {
            // code
        } finally {
            // code
        }
    }
    return 0
  }
}

main(){
  return A().foo()
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
