public interface I1 {
    func foo() {0}
    static func goo() {1}
}

public open class A <: I1 {
    
    
}
public class B <: A {}

main() {
    let b = B()
    b.foo() + B.goo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
