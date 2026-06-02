// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test test1
// EXEC: %compiler %cmp_opt %compile_lib_opt test/test.cj -o test/test.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt test/test.%middle test1/test1.cj --import-path test -o test1/test1.%middle
// EXEC: %compiler %cmp_opt test/test.%middle test1/test1.%middle %n.cj --import-path test --import-path test1 -o %output
// EXEC: %run %run_opt %output %run_args

internal import test.*
internal import test1.*

main(): Int64 {
    var a = A()
    print("test2\n")
    return 0
}
