// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// ERRCHECK: %compiler --output-type=dylib -o lib-macro_define.so define.cj 

import define.*

main(): Int64 {
    var b = @M(1)
    return 0
}

/* SCAN
[31merror[0m: Cannot support specify file prefix 'lib-macro_' without '--compile-macro' option.
Invalid options. Try: 'cjc --help' for more information.
*/
