/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1{}

extend C1{
    func test(){
        var result:String = match{
        case true => "true"
        case false => "fail"
        case _ => "an"
        }
    }
}

main() {
    var a = C1().test()
    0
}
