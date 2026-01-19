/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public struct S {
    var a = 0
    mut prop p1: Int64 {
        get() { a }
        set(value) { a = value }
    }
    public mut prop p2: Int64 {
        get() { a }
        set(value) { a = value }
    }
}

public func f(){
    if(S().p1 == 0 && S().p2 == 0){
        return 0
    }
    return 1
}
