// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1a-3: spawn+Future → CJFillMetadata fillTemplate 的 Future 属性分支
// spawn 和 Future 是 Cangjie 关键字，无需 import
// 注: LLT CJCov 环境下 std.sync.Mutex 不可用，本用例仅覆盖 Future 分支
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func compute(): Int64 {
    var sum = 0
    for (i in 1..100) { sum += i }
    return sum
}

main(): Int64 {
    let f = spawn { compute() }
    let r = f.get()
    if (r > 0) { return 0 }
    return 1
}
