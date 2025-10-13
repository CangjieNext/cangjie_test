class A {
    var a = 1
    public init (i: Int64) {
        a = i
    }
    public operator func -(): A {
        A(-a)
    }
    public operator func !(): A {
        A(-a)
    }
}

var a = A(0)

main()
{
    !a
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
