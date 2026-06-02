/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a: Float32 = 1

main() {
    match (a) {
        case 1.0 => 3
        case _ => 1
    }

    match (1.0) {
        case a => 3
        case 2.0 where a > 1.0 => 1
    }

    return 1
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_unreachable_pattern
