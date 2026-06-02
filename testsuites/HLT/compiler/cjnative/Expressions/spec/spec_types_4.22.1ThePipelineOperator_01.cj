/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func f(x: Int32): Int32 { x + 1 }
func h(b: Bool) { b }
func g<T>(x: T): T { x }
class A {
    public let a: Int32
    public let b: Int32
    public init(x: Int32) {
        a = x
        b = 0
    }
    public init(x: Int32, y: Int32) {
        x |> init  
        b = y
    }
}

main(): Int64 {
    let a: Int32 = 1
    var res = a |> f  // ok
    var res1 = a |> {x: Int32 => x + 1}  // ok
    let res3 = a < 0 || a > 10 |> h  // Equivalence：(a < 0 || a > 10)  |> h
     
    return 0
     
}
// ASSERT: scan parse_expected_expression
