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
    public let a1 = 20
    let a2 = 20
    let a3 = 20

    @Frozen
    public func getWidth1(): Int64{
        return a3
    }

    public var a4 = 20
    var a5 = 20
    var a6 = 20

    @Frozen
    public func getWidth2(): Int64{
        return a6
    }

}

public func f(){
    var a = Rectangle()
    if(a.a2 == 20 && a.a3 == 20 && a.a5 == 20 && a.a6 == 20){
        return 0
    }else{
        return 1
    }
}