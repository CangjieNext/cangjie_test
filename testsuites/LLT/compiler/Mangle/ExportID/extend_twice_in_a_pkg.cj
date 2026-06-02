// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC-PIPE:%compiler %cmp_opt pkg1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg1.*

// test extend a decl twice in one package,
// check export ID conflict error when importing.
main() {
    var a = A<Int64>()
    a.foo()
    a.bar()
    0
}

// Previously, there was an error.
/*
error: decls named '' with same exportId '_CN4pkg1ExtendCN4pkg11AIGTEEE' are imported
  ==> (package pkg1)a.cj:27:1:

1 error generated, 1 error printed.
 */
