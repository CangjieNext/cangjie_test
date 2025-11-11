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
func g(x: Float64): Float64 {
    x
}

var fg = f ~> g
var fg2 = g ~> g                        

main() {
    var fg = f ~> g
    var fg2 = g ~> g
    0
}
