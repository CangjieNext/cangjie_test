// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(x:Float64) {
    if (x != Float64.NaN) {
        println(x * 2.0)
    }

    if (Float64.NaN == x) {
        println(x * 2.0)
    }
}