// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %pkg_opt pkg %compile_lib_opt -o libpkg.%middle
// EXEC: %compiler %cmp_opt libpkg.%middle main.cj -o %main
// EXEC-0: %run %run_opt %main

import pkg.*

main() {
    if (ENCODING != "utf-8") {
        return 1
    }
    if (A1.ID != "1") {
        return 1
    }
    if (A2<Int32>.ID != "2") {
        return 1
    }
    if (A3<Int32>.ID != "3") {
        return 1
    }
    return 0
}
