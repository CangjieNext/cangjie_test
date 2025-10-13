package inc

public open class A {}
public interface I1 {}
extend A <: I1 {
    public prop k: Int64 {
        get() {
            2
        }
    }
}

main() {
    let a: A = A()
    a.k
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
