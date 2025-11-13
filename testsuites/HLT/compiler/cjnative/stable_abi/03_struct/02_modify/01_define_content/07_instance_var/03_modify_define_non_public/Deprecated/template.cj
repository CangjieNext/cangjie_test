/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    let a2 = 20
    @Deprecated["this value is deprecated", strict: false] let a5 = 50
    @Deprecated["this value is deprecated", strict: true] let a8 = 80
}

public func f(){
    var a = Rectangle()
    if(a.a2 == 20 && a.a5 == 50){
        return 0
    }else{
        return 1
    }
}