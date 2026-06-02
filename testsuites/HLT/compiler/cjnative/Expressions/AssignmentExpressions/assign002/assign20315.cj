/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class A{
    public var a :Int32
    public init(a:Int32){
        this.a = a
    }
    public func test(){
        this = 1 
        this() = 1 
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan parse_invalid_left_hand_expr
