// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var a = 3
var c:Int8 = 4
func bar(a:Int8) {
  return a + 1
}
func bar2(a:Int8) {
  return a + 2
}
func foo(a:Int8, b:Int8) {
  func bar(a:Int8) {
    return a
  }
  func bar(c:Int8, d:Int8) {
    bar(1)
    bar2(2)
    return c - d
  }
  func bar2(c:Int8, d:Int8) {
    return c + d
  }
  return bar(a,b)
}

main(){
 foo(127, 2)
}
