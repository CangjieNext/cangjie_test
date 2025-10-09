import stdx.log.*
import stdx.net.http.*

func foo(){
  var rep = HttpResponseBuilder().build()
  let sta: Int32 = Int32(rep.status)
  func foo1(a:Int32){
    return a
  }
  {
    => if (sta > -100){
      return
    }else{
      ()
    }
    foo1(sta)
    ()
  }()
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
