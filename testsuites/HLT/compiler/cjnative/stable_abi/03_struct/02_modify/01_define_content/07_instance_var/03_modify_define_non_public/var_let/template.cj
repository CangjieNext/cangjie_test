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
    let a1 = 10
    var a2 = 20
}

public func f(){
    if(Rectangle().a1 == 10 && Rectangle().a2 == 20){
        return 0
    }else{
        return 1
    }
}