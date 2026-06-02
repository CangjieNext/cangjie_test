// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt pkg/pkg1/pkg2/a.cj -o a.%middle
// EXEC-PIPE: %compiler %cmp_opt a.%middle %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan pkg.pkg1.pkg2::ClassA<...>::getArray()
internal import pkg.pkg1.pkg2.*

main() {
    ClassA<Int64>().getArray()
}
