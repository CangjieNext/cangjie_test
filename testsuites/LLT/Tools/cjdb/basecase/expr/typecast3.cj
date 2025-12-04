// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A {
    protected open func print() {
        print("A")
    }
}

class B <: A {
    protected override func print() {
        print("B")
    };
    func bExclude() {}
}

class C <: A {
    protected override func print() {
        print("C")
    }
}

main() {
    let b: Array<B> = [B(), B()]
    let a = b as Array<C> 
    ()
} 