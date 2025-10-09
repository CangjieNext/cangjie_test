interface A{
    func f(): Unit
}

interface Base <: A{
    func f1(): Unit
}

interface Sub <: Base{
    func f2(): Unit
}
class B{}
extend B <: Sub & A {
    public func f(): Unit {}
    public func f1(): Unit {}
    public func f2(): Unit {}
}

main(){}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
