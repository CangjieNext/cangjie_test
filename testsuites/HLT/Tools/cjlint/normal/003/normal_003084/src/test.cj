/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

main(){
  let mtx: ReentrantMutex = ReentrantMutex()
  try {
    mtx.lock() // cjlint-ignore !G.CON.02
  } catch (_) {
    mtx.unlock()
  }
  return 0
}


