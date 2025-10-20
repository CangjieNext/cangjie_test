// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(x:Float16) {
    if (1.11111 != Float16.NaN) {
        println(x * 2.0)
    }

    if (Float16.NaN == 1.1111) {
        println(x * 2.0)
    }
}