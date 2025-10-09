import std.sync.*

let mtx: ReentrantMutex = ReentrantMutex()

enum A{
  B|C
}

main(){
  var en: A = A.B
  var result: Future<Unit> = match(en){
    case C => spawn{
        try {
            mtx.lock()
        } catch (_) {
        }
    }
    case B => spawn{mtx.lock()}
  }
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
