/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var test1 = Some(100)
var a = [0, test1.getOrThrow()]
class A{
    func test(){
        for (i in a){
            print(1)
        }
    }
}


main(){
    return 0
}

