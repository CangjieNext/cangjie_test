package inc

public interface I1 {
    prop p: Int64 {
        get() {
            1
        }
    }
}

public struct A1 <: I1 {
    public prop p: Int64 {
        get() {
            0
        }
    }
}

main() {
    let a = A1()
    return a.p
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
