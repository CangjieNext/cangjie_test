// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// (CJNATIVE) ERRCHECK: %compiler %cmp_macro define.cj -o define.so
// (not CJNATIVE) ERRCHECK: %compiler %cmp_macro define.cj -o define.cbc

import define.*

main(): Int64 {
    var b = @M(1)
    return 0
}

/* SCAN
[31merror[0m: Cannot support specify output file name with '--compile-macro' option.
Invalid options. Try: 'cjc --help' for more information.
*/
