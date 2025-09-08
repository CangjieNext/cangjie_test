// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: lib
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt lib/ -o lib.%middle
// EXEC: %compiler %cmp_opt lib.%middle %f 2>&1 | compare %f

package reproduce

public import reproduce.lib.*

main() {
    hello()
}

/* SCAN
*/
