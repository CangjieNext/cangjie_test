package b

public interface I {
    static func foo() : Int64
}

public class C<T> where T <: I {
    @Frozen
    public static func goo() : Int64 {
        T.foo()
    }
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
