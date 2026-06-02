// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.sync.*

var m1 = ReentrantMutex()
var m2 = m1
class A<T>{
  var b =  1
  func temp() {
    spawn {
        m1.lock()
        b = 2
        m1.unlock()
    }
    spawn {
        m2.lock()
        b = 3
        m2.unlock()
    }
  }
}

main(){}
