struct A {}
interface I1 {
    
}

extend A {
    public func jar(): Int64 {3}
}
extend A {
    func fimpl() {3}
    public prop f: Int64 {
        get() {fimpl()}
    }
}

extend A {}

main() {
    let a = A()
    a.jar()-a.f
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
