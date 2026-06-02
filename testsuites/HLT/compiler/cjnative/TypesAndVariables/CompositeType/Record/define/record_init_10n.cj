/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1|compare %f

struct GenRec{
    public let a: Int64
    public var b: Int32
    public init(x: Int64, y:Int32, str:String){
        class Data{var a=3} 
        this.a = Data().a
    }
    public var b: Int32 = 1
}

main():Int64{
    var rec = GenRec(3, 4,"1")
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
