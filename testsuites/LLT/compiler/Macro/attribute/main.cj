// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@M[1]
@M[1]
func test(): Int64 {
    var a: Array<Unit> = [()]
    var b: Array<Unit> = [()]
    var c: Array<Unit> = Array<Unit>(1, repeat: ())

    0
}

@M[1]
@M[1]
main(): Int64 {
    return 0
}
