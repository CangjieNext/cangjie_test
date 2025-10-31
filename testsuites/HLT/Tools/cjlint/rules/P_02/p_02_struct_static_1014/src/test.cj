/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.ReentrantMutex

struct Demo{
  static var res: Unit = ()
}

main(): Int64 {
  try{
    spawn{
      Demo.res = ()
    }
    spawn{
      var a = Demo.res
    }
  }catch(_){spawn{}}
  return 0
}
