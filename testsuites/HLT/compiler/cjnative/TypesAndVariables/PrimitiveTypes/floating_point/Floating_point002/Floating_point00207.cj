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
    var a: Float32 = NaN
    var b: Float32 = NaN
    if (a - b > 0.0001) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_undeclared_identifier
