/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface A{}
class B <: A{
    static var a : Float64 = 4.9E-324
}

extend B{
    func test():Float64{
        return 4.9E-324
    }
}
main(){

}

