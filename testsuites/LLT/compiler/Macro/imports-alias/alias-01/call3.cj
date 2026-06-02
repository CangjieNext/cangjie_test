// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj ../define3.cj
// EXEC: %compiler define1.cj %cmp_macro
// EXEC: %compiler define3.cj  %compile_lib_opt -o libp3.%lib_extension
// EXEC: %run_macro %compiler %cmp_opt %f libp3.%lib_extension -o %output

import p1.*
import p3.*

@M1
class A {}

main() {
}

/* SCAN
M1 at compile time
*/
