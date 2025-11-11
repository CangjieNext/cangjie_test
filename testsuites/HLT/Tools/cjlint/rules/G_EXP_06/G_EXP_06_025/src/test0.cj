/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var test1 = false
interface A{
    func test(){
        var a : Bool = true
        var b : Bool = test1 == false
    }
}

main(){
    return 0
}

