// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./test.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt test.cj -o test.%middle
// EXEC: %compiler %cmp_opt test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import test.*

var i: UInt16 = C.size()

main(): Int64 {
    if (i == 3) {
        return 0
    } else {
        return 1
    }
}
