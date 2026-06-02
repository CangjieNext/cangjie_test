/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan parse_conflict_modifier

public struct BB{
    public var a : Int64
    public static init(temp:Int64){    
        a = temp
    }
}

protected var AA = BB(1)

main(){
    var a = BB(0)
    return a.a
}
