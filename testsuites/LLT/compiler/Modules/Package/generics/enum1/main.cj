// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %frontendCompiler %typecheck %cmp_opt pkg/pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %frontendCompiler %typecheck %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkg.TimeUnit
internal import pkg.g_time

main() {
    var y: Int32 = 10
    var yy: Int32 = 1000
    var time = TimeUnit<Int32>.century
    var time1 = TimeUnit<Int32>.Year(y)
    var time2: TimeUnit<Int32> = TimeUnit<Int32>.Month(y, y * 9)
    var time3 = TimeUnit<Int32>.Day(yy, yy, yy)
    var ans: Int32 = match (time) {
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time1) {
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time2) {
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time3) {
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (g_time) {
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    }
    if (ans == 13111) {
        return 0
    }
    return 1
}
