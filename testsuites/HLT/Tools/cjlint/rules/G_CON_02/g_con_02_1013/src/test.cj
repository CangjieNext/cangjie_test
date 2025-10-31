/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

enum A{
  B|C
}

let mtx: ReentrantMutex = ReentrantMutex()

main(){
  var en: A = A.B
  var result: Unit = match(en){
    case C =>
        try {
            mtx.lock()
        } catch (_) {
        }
    case B => ()
  }
  return 0
}


