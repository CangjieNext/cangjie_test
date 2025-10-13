interface A {
    func dam(): Unit { println(3) }
}

struct V <: A {
    public func jam(): Unit {println(4)}
}

main() {
    let a = V()
    a.dam()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
