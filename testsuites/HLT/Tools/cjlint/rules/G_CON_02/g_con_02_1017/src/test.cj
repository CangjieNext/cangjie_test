import std.sync.*

class A{
  private let mtx1: ReentrantMutex = ReentrantMutex()
  private let mtx2: ReentrantMutex = ReentrantMutex()
  private let mtx3: ReentrantMutex = ReentrantMutex()
  private let mtx4: ReentrantMutex = ReentrantMutex()
  private let mtx5: ReentrantMutex = ReentrantMutex()
  private let mtx6: ReentrantMutex = ReentrantMutex()
  private let mtx7: ReentrantMutex = ReentrantMutex()
  private let mtx8: ReentrantMutex = ReentrantMutex()
  private let mtx9: ReentrantMutex = ReentrantMutex()
  private let mtx10: ReentrantMutex = ReentrantMutex()

  func foo(){
    var res = {
      => try {
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
            mtx1.unlock()
            mtx2.unlock()
            mtx3.unlock()
            mtx4.unlock()
            mtx5.unlock()
            mtx6.unlock()
            mtx7.unlock()
            mtx8.unlock()
            mtx9.unlock()
            mtx10.unlock()
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
