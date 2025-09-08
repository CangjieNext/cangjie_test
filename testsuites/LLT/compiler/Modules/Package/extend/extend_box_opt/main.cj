// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %enableO2 %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %enableO2 pkg.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan [1, 2]

internal import pkg.*

main() {
    var map = mapToA(MapA([("route", "1"), ("method", "2")]))
    println(map)
}
