// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I1 {
    func f(): Unit
}

interface I2 {
    func f(): Unit
}

func g(i: I1, j: I2): Unit {
    return i.f()
}
