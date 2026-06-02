// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(t:T){
  let aaa = t
  0
}
class A {
  var a:Int64 = 123
  let b:Int16 = 9
}
struct B {
  var a = 100
  var b:Int32 = 101
}
main() {
    foo(1)
    foo("abc")
    foo(r'a')
    foo(A())
    foo(B())
    0
}