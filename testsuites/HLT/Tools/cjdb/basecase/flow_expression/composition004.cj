/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(x: Int64): Float64 {
    Float64(x)
}

func h1<T>(x:T): T {
    x
}

main() {
    var l1 = h1<Int64> ~> f
    var l2 = f ~> h1<Float64>
    var l3 = h1<Float64> ~> {x: Float64 => x} ~> {x: Float64 => x}
    0
}
