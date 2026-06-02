// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// DEPENDENCE: p2
// EXEC:%compiler p1/file1.cj %compile_lib_opt -o file1.%middle
// EXEC:%compiler p2/file2.cj %compile_lib_opt -o file2.%middle
// EXEC:%compiler file1.%middle file2.%middle file3.cj -o %output
// EXEC-PIPE-0: %run %output

internal import test1.*
internal import test2.*

main() {
    f1<Int64>()
    f2<Int64>()
    0
}
