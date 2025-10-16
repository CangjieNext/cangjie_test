open class C{
    public static prop b:Int64{
        get(){
            return 1
        }
    }
    public static prop a:Int64{
        get(){
            return -1
        }
    }
}

class D <: C{

}

let c = C()

func useA(){
    return C.a
}

func useB(){
    return C.b
}

func useType(){
    let c:C
}

main() {
    return useA() + useB()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
