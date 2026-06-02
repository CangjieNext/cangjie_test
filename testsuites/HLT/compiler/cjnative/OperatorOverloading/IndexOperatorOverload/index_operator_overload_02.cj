/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



// bnf测试  static修饰/缺少operator修饰符
class A{
    public var a: Int64
    public var b: Int64
    public init(x: Int64){
        a = x
        b = x
    }
    public static operator func []( index: Int64, value: Int64): Unit{  
        x.b = value
    }
    public func []( index: Int64): Int64{ 
        if (index > 1) {
            3
        } else {
            x.a
        }
    }
}

main(): Int64{
    var a = A(2)
    return 0
}
// ASSERT: scan parse_conflict_modifier
// ASSERT: scan parse_expected_name
