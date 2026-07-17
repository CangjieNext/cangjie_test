// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1c-2: 多长度字符串常量 → CJMetadata getOrInsertStrPoolOffset/StrPoolDict分桶
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    let s1 = "a"
    let s2 = "ab"
    let s3 = "abcdef"
    let s4 = "abcdefghij"
    let s5 = "这是一个比较长的中文字符串用来触发字符串池分桶逻辑"
    let s6 = "another medium length string for pool splitting"
    let combined = s1 + s2 + s3 + s4 + s5 + s6
    if (combined != "") { return 0 }
    return 1
}
