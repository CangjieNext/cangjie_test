/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var arr = [0, 1, 2, 3, 4]
    for (i in arr) {
        let g = {=> break}
    }
    return 0
}
// ASSERT: scan sema_invalid_loop_control
