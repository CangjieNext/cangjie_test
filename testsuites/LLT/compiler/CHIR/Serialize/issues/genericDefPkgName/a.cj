package a

import b.*

struct S <: I {
    public static func foo() : Int64 {
        0
    }
}

main ()
{
    C<S>.goo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
