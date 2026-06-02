/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



// bnf测试，操作符函数为泛型函数
class A<T> {
    public var a: Int64
    public var b: Int64
    public init(x: Int64){
        a = x
        b = x
    }
    public operator func [](x: A<T>, index: Int64, value: Int64): Unit where T <: Int64{ 
        x.b = value
    }
}

main(): Int64{
    var a = A(2)
    return 0
}
// ASSERT: scan parse_unexpected_where
// ASSERT: scan parse_expected_character
