// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A{
    private var value = 0
    var b = 0
    mut prop a: Int64{
        get(){
            value
        }
        set(v){
            value = v
        }
    }
}

main(){
    let x = A()
}