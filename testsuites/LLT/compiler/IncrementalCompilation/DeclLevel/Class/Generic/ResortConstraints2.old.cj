
class A<T, U> where T <: ToString, U <: Any{

}

func foo(){
    let a = A<Int64, Int32>()    
    return 0
}

func useType(){
    let a:A<Int64, Int32>
}

main() {
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
