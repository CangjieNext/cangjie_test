/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.net.http.*

func foo(){
  var rep = HttpResponseBuilder().build()
  var con: ?Int64 = rep.bodySize
  if (con != Option<Int64>.Some(100)){()}else{
    return
  }
  func foo1(a:?Int64){
    return a
  }
  foo1(con)
  ()
}

main(): Int64 {
  foo()
  0
}

