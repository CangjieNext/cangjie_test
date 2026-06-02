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
    var s = S1()

    s.f1(1)
    if (s.field != 2) {
        return 1
    }

    s.f1(true)
    if (s.field != 3) {
        return 1
    }

    s.f1(1)
    if (s.field != 2) {
        return 1
    }

    s.f1(true)
    if (s.field != 3) {
        return 1
    }

    0
}
