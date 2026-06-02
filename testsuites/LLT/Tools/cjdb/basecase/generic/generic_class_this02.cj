// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A {
  A(let a: Int64) {}
}
 
class B <: A {
  let b: Int64 =1
  init(b: Int64) {
      super(30) //expr super(30) 
  } 
  init() {
      this(20) //expr this(20)
  }
}


main() {
  var a = A(1)
  var b = B() 
  0
}