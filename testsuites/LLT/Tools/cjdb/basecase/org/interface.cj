// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package org::default

class C1 <: I1 {
  var a = 1
  public func f1():Unit {
    println("hello")
  }
}

interface I1 {
  func f1():Unit
}

main(){
  var a1 = C1()
  var a2:I1 = C1()
  0
}
