// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Number<T>{
  operator func +(that: T) : T
}

extend Int64 <: Number<Int64>{ 

}

extend Int64 <: Number<Int32>{ 
  public operator func +(that: Int32) : Int32{
    Int32(this) + that
  }
}

extend Int64 <: Number<Int16>{ 
  public operator func +(that: Int16) : Int16{
    Int16(this) + that
  }
}

extend Int16 <: Number<Int16>{ 

}

extend Int16 <: Number<Int32>{ 
  public operator func +(that: Int32) : Int32{
    Int32(this) + that
  }
}

extend Int16 <: Number<Int64>{ 
  public operator func +(that: Int64) : Int64{
    Int64(this) + that
  }
}

extend Int32 <: Number<Int32>{ 

}

extend Int32 <: Number<Int16>{ 
  public operator func +(that: Int16) : Int16{
    Int16(this) + that
  }
}

extend Int32 <: Number<Int64>{ 
  public operator func +(that: Int64) : Int64{
    Int64(this) + that
  }
}

struct A<T1, T2, T3> {
  static var a: Int64 = 1
}

extend<T1, T2, T3> A<T1, T2, T3> where T1 <: Number<T2> , T2<: Number<T3> {
  static func foos1(a: T1, b: T2, c: T3){
    return a + b + c
  }

  func foo(a: T1, b: T2, c: T3){
    return a + b + c
  }

}

extend<T1, T2, T3> A<T1, T2, T3> {
  static mut prop pas: Int64{
    get(){
      a
    }
    set(v){
      a = v
    }
  }

  mut prop pa: Int64{
    get(){
      a
    }
    set(b){
      a = b
    }
  }
}

extend<T1, T2, T3> A<T1, T2, T3> where T1 <: Number<T2> , T2<: Number<T3> {
  static func foos<X, Y, Z>(a: T1, b: T2, c: T3) {
    return foos1(a, b, c)
  }

  static func foos<T1, T2>(a: T1, b: T2) where T1 <: Number<T2>{
    return a + b
  }
}

class C{}

main() {
  var a1 = A<Int16, Int32, Int64>.foos<Int16, Int32, Int64>(1, 2, 3) 
  var a2 = A<Int16, Int32, Int64>().foo(1, 2, 3) 
  A<Int64, Int32, A<Int64, Int32, Int16>>.pas = 3
  var a3 = A<Int64, Int32, A<Int64, Int32, Int16>>.pas
  var c = A<Int64, String, C>()
  if(c.pa - 1 == 0){
    c.pa = 3
  }

  var a4 = c.pa
  var a5 = A<Int16, Int32, Int64>.foos<Int16, Int32, Int64>(1, 2, 3)
  var a6 = A<Int16, Int32, Int64>.foos<Int32, Int32, Int64>(1, 2, 3) 
  var a7 = A<Int16, Int32, Int64>.foos<Int32, Int32>(1, 1) 

  if (a1 == 6 && a2 == 6 && a3 == 3 && a4 == 3 && a5 == 6 && a6 == 6 && a7 == 2) {
    return 0
  }
  return 1
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
