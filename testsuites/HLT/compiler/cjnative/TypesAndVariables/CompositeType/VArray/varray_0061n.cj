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
    var varr: VArray<Int64, $3> = [1, 2, 3]
    var sum = 0
    for (i in varr) {
        sum += i
    }
    return sum - 6
}
// ASSERT: scan sema_expr_in_forin_must_has_iterator
