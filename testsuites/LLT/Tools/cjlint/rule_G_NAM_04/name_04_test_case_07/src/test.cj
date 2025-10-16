// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct FuncCheck03{

    FuncCheck03() {}

    func rightExample03(){
        func rightExample04(){}
    }
}

class FuncCheck04{
    public static var aaa: Int64 = 1

    public mut prop b: Int64 {
        get() {
            aaa
        }

        set(v) {
            v
        }
    }
}

class FuncCheck05{
    public operator func +(x:String){return x}
}

foreign func rand_to_test(): Int32

main() {
    return
}