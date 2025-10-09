import stdx.log.*
import stdx.net.http.*

func foo(){
  var rep = HttpResponseBuilder().build()
  var s1: Protocol = rep.version
  if(s1 == HTTP1_1){
    return 
  }else{
    ()
  }
  func foo1(a:Protocol){
    return a
  }
  foo1(s1)
}

main(): Int64 {
  foo()
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
