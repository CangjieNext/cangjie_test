// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler -Woff unused %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler -Woff unused %cmp_opt --debug-macro %f -o %output
// EXEC: %diff %f.expect %f.macrocall

import test.*

@M[1]
main(): Int64 {
    var myArray: Array<Array<Array<Int32>>> = Array<Array<Array<Int32>>>()
    print(myArray)
    return 0
}

