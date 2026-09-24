/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface Base {
    func f1(): Unit
}

interface Sub <: Base {
    func f2(): Unit
}

class B <: Sub & Base {
    public func f1(): Unit {}
    public func f2(): Unit {}
}

main() {
    let b = B()
    b.f1()
    b.f2()
}
