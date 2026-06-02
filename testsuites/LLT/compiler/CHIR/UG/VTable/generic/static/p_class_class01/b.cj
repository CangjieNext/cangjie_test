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

class CCC <: BBB<Int8> {}

open class BBB<U> <: AAA<Int32> {
    public static func foo1() {
        2
    }
    public func foo2() {
        3
    }
}

class DDD <: BBB<Int8> {}

main() {
    return CCC.foo1() + AAA<Int32>.foo1() - 3
}
