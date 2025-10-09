// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface Base {
    func f1(): Unit
}

interface Sub <: Base {
    func f2(): Unit
}

interface Sub2 <: Sub & Base{
    func f3(): Unit
}