interface A<T> {}
extend Int32 <: A<Int32> {}
enum B<T> <: A<T> where T <: Any {
    A(UInt32)

    public static func foo(): Int64 { 1 }
}






let a = B<Int64>.A(1u32)

func foo(){
    let a:B<Int64>
}

main(): Int64 { B<Int32>.foo() }


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
