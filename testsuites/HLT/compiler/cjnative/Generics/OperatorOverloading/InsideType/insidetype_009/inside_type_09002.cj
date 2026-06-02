/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f


interface C{
    let c = 1 
}

interface A<T> <: C{
    func test():Int64{1}
    operator func *(input_b:A<T>):Bool  {
        var b = test() 
        var c = this() 
        var d = super() 
        var e = super.c 
        var g = this.test() 
        return true
    }
}


main(): Int64 {
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
