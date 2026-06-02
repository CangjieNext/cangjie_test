// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC:%compiler   pkg.cj %compile_lib_opt -o pkg.%middle
// EXEC:%compiler   pkg.%middle %f -o %output
// EXEC: %run %output

internal import pkg.*

main() {
    A().f({i =>})
    0
}
