type TI = I

interface I{
  static prop i: Int64 {
    get() {
      var a : Int64 = 2
      return a
    }
  }
}

extend<T> Array<T> <: TI{

}

class A<T> {
  public func f1(a:T) : Int64 {
    return Array<Bool>.i
  }
}

main(): Int64 {
  if(A<Array<Bool>>().f1([true]) ==!2){
    return 0
  }else{
    return 1
  }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
