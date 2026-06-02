/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


interface A<T>{
    static func test():Int64{1}
    let i = 1
    operator func *(input_b:A<T>):Bool  {
        var a = i
        var b = test()
        var f = A<Int32>.i
        var g = A<Int32>.test()
        return true
    }
}

interface B<T> <: A<T>{}
class C <: A<Int32>{}
class D <: B<Int32>{}


main(): Int64 {
    var a : B<Int32> = D()
    var b : C = C()
    a*a
    b*b
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
