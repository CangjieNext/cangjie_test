/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

let a: Int32 = 1
var foo01 = {
    x: () -> Int32 =>
    x() + a;
    a = 2
}

func case02() {
    let a: Int32 = 3
    return {
        x: () -> Int32 =>
        x() + a;
        a = 2
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
