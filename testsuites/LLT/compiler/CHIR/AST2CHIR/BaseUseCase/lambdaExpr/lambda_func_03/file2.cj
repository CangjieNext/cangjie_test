// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: file1.cj
// EXEC-PIPE: %compiler %compile_lib_opt file1.cj
// (CJNATIVE)EXEC-PIPE: %compiler %f libA.a -o %output

// EXEC: %run %run_opt %output

internal import A.*

var x = foo<Int64>

main() {
    x() - 1
}
