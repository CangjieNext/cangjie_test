enum E {
    A(UInt32)
    
    prop size:UInt64{
        get(){
            return match (this){
                case A(a) => UInt64(a)
            }
        }
    }
}

let a = E.A(1u32)

func foo(){
    let a:E
}

main(): Int64 { 
    let p = E.A(1u32)
    Int64(p.size)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
