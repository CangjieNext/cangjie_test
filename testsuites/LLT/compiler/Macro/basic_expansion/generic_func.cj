// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %diff %f.expect %f.macrocall

import test.*

class A<T> {}

@M[1]
@M[1]
func f<T>(x: A<T>): A<T> {
    return x
}

@M[1]
main(): Int64 {
    return 0
}
