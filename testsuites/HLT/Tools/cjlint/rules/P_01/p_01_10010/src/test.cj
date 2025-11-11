/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

main(): Int64 {
  let lock1: ReentrantMutex = ReentrantMutex()
  let lock2: ReentrantMutex = ReentrantMutex()
  var a: ?Int64 = Some(1)
  var b: Future<Unit> = match(a){
    case Some(2) => spawn{synchronized(lock1) {synchronized(lock2) {}}}
    case Some(x) => spawn{synchronized(lock2) {synchronized(lock1) {}}}
    case _ => spawn{synchronized(lock2) {synchronized(lock1) {synchronized(lock1) {synchronized(lock2) {}}}}}
  }
  0
}
