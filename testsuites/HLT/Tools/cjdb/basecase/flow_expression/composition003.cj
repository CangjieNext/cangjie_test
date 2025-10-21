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

main() {
    var l1 = {x:Int64 => x} ~> f
    var l2 = f ~> {x:Float64 => x}
    var l3 = {x:Int64 => x} ~> {x:Int64 => x}~> {x:Int64 => 1}
    var l4 = f ~> {x:Float64 => x} ~> {x:Float64 => x}
    0
}
