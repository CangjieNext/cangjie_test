// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I {
    func f(): Unit
}

func f<T>(i: T): Unit where T <: I {
    return i.f()
}

func g(i: I): Unit {
    return i.f()
}
