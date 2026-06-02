class A {}

enum B<T> where T <: A{
  EB(T)
}

extend<T> B<T> where T <: A{
  static func foos<T>(a: T){
    return a
  }

  func foo<T>(a: T){
  return a
  }

  static prop pas : B<A>{
  get(){
  B<A>.EB(A())
 8}
  }

  prop pa: B<A>{
  get(){
  B<A>.EB(A())
  }
  }
}



main() {
    B<A>.pas
    B<A>.EB(A()).pa
    return B<A>.foos(1) +B<A>.EB(A()).foo(-1)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
