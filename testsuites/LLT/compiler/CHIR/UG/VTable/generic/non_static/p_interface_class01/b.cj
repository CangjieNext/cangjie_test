// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC: %compiler pkg/a.cj %compile_lib_opt -o libpkg.%middle
// EXEC: %compiler libpkg.%middle b.cj -o %output

import pkg.*

public open class BBB <: AAA & III<Int32> {
    public func foo(a: Int32): Int64 {
        Int64(a)
    }
}

main() {
    BBB().foo(1) + BBB().foo(Int32(9)) - 10
}
