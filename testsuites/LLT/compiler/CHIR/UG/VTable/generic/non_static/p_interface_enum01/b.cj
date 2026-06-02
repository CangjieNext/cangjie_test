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

main() {
    return RED<Int32>.foo1(1) - 2 + RED<Int32>.foo2() - 1 + GREEN<Int32>.foo3() - 3
}
