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

func case08() {
    while (while (true) {
            break
        }) {
        print("yes")
    }
}

func case10() {
    while (true) {
        match (break) {
            case a => a
        }
    }
}
// ASSERT: scan sema_mismatched_types
