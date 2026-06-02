// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1 p2
// EXEC: %compiler %compile_lib_opt -p p1 -o p1.%middle
// EXEC: %compiler %compile_lib_opt -p p2 -o p2.%middle
// (CJNATIVE) EXEC: %compiler p2.%middle p1.%middle %f -o %output
// (not CJNATIVE) EXEC: %compiler p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import p2.f

main(): Int64 {
    let obj = f()
    return 0
}
