/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output 
// ASSERT: scan sema_cannot_assign_to_subscript

main(): Int64 {
    let a = Array<String>(3, {
        i => match (i) {
            case 1 => "a"
            case _ => "c"
        }
    })
    a[1] = r'a'
    return 0
}
