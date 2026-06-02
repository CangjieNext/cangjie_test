/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_used_before_initialization
/*
    TestPoint: 测试未赋值变量在一些表达式结构中的使用
 */

main() {
    var a: Int64
    if (a is Int64) {
        a = 0
    } else {
        a = 1
    }
    a
}
