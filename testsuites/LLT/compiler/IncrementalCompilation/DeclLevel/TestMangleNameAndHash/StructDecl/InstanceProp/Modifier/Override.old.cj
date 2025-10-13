struct S <: I{
    public  //Modifier
    mut
    prop size  // Identifier
    :Int64  // Type
    {
        set(a) // param name
        {
            0  // body
        }

        get()
        {
            0  // body
        }
    }
}

interface I{
    mut prop size:Int64{
        set(a){
            0
        }
        get(){
            0
        }
    }
}

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
