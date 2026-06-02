// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func div(a: Int32, b: Int32): Int32 {
    if (b != 0) {
        return a / b
    } else {
        throw ArithmeticException()
    }
}
