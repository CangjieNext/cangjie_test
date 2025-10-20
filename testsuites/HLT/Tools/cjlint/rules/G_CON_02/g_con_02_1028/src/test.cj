import std.sync.*

interface A{
  func foo(){
    let mtx: ReentrantMutex = ReentrantMutex()

    do{
      mtx.lock()
    }while(false)

    if(false){}else{
        try {
            mtx.lock()
        } catch (_) {
        } finally {

        }
    }

  }
}

main(){
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
