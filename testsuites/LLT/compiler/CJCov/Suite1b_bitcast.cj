// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1b-3: 数组下标load → InsertCJTBAA load路径 TBAA
// (精确bitcast IR形态由 lit 测试覆盖: test/Transforms/Cangjie/TBAA/)
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    let arr: Array<Int64> = [10, 20, 30, 40]
    var sum: Int64 = 0
    for (i in 0..4) { sum += arr[i] }
    var va: VArray<Int64, $4> = [1, 2, 3, 4]
    va[0] = 100
    sum += va[0]
    if (sum == 200) { return 0 }
    return 1
}
