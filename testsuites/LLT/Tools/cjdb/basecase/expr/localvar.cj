// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var a = 3
var c:Int16 = 4
func foo(a:Int16, b:Int16) {
  var c:Int32 = 5
  func bar(a:Int32, b:Int32) {
    var d:Int64 = 6
    return a + b
  }
  return bar(Int32(a + b), c)
}
main(){
 foo(1, 2)
}