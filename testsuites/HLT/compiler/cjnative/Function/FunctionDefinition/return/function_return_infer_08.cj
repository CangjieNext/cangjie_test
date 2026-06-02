/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    case01()++
    case02().a++
    case02().b++
    case03().a++
    case03().b++

    return 0
}

func case01(){
    var a:Int32 = 1
    a
}

func case02(){
    A()
}

func case03(){
    B()
}

class A{
    public var a:Int32 = 1
    public let b:Int32 = 1
}

struct B{
    public var a:Int32 = 1
    public let b:Int32 = 1
}
// ASSERT: scan parse_invalid_incre_expr
