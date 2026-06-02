/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    let o1: ?Int64 = Some(100)
    let o2: ?Int64 = None

    if (o1.toString() == "Some(100)" && o2.toString() == "None") {
        return 0
    }
    return 1
}
