// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC:%compiler %cmp_opt_chir2hlir %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC:%compiler %cmp_opt_chir2hlir ./pkg.%middle %n.cj %verbose_opt -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

// ASSERT: scan 9

internal import b.*

main() {
    var a = MyRecord1<UInt8>(9)
    print(a.a.toString())
    0
}
