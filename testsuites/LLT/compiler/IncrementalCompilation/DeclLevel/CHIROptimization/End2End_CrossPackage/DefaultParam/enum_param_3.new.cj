package inc

public enum E{
    R | G | B
    @Frozen
    public static func foo(param !: Int64 = 1) : Int64 {
        let kar = Array<Int64>(1000000) {i=>i*i+i}
        for (i in kar){
            let j = i*60-i 
            println(j)
        }
        return param
    }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
