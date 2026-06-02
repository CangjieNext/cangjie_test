interface I1 {
func foo() {}
}
interface I2 <: I1 {
    func gar(): Unit
}
interface I4 {}
interface I3<T> where T <: I4
{

}

class A <: I2  {
    public func gar(): Unit {}
}
enum E1 <: I1 {R|K 

}
struct B<T> <: I3<T> where T <: I4 {}


let a: Any = A()
let b: Any = B<Unit>()
let c: I3<Int32> = B<Int32>()
let d: I1 = R 
let e: Any = K

main() {}

extend Int32 <: I4 {}
extend Unit <: I4 {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
