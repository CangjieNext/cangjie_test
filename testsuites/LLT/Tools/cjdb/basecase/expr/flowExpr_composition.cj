// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func f(x: Int32): Float32 { Float32(x) }
func g(x: Float32): Int32 { Int32(x) }

func h1<T>(x: T): T { x }
func h2<T>(x: T): T { x }

main():Int64 {
    var fg = f ~> g // Equivalence: {x: Int32 => g(f(x))}
    let lambdaComp = {x: Int32 => x} ~> f
    var hh = h1<Int32> ~> h2<Int32> 
    0
}