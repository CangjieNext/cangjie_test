/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

main(){
  let mtx1: ReentrantMutex = ReentrantMutex()
  let mtx2: ReentrantMutex = ReentrantMutex()
  let mtx3: ReentrantMutex = ReentrantMutex()
  let mtx4: ReentrantMutex = ReentrantMutex()
  let mtx5: ReentrantMutex = ReentrantMutex()
  let mtx6: ReentrantMutex = ReentrantMutex()
  let mtx7: ReentrantMutex = ReentrantMutex()
  let mtx8: ReentrantMutex = ReentrantMutex()
  let mtx9: ReentrantMutex = ReentrantMutex()
  let mtx10: ReentrantMutex = ReentrantMutex()

  if(true){
    try {
        mtx1.lock()
        mtx2.lock()
        mtx3.lock()
        mtx4.lock()
        mtx5.lock()
        mtx6.lock()
        mtx7.lock()
        mtx8.lock()
        mtx9.lock()
        mtx10.lock()
    } catch (_) {

    } finally {

    }
  }

    try {
    } catch (_) {
        mtx.unlock()
    } finally {
        mtx1.unlock()
        mtx2.unlock()
        mtx3.unlock()
        mtx4.unlock()
        mtx6.unlock()
        mtx7.unlock()
        mtx8.unlock()
        mtx9.unlock()
        mtx10.unlock()
    }

  return 0
}


