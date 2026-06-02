/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1:  %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@OverflowWrapping
func test(a: Int8, b: Int8) {
    var x: Int8 = 200
    return 1
}

main() {
    return Int64(test(100, 100))
}
// ASSERT: scan sema_exceed_num_value_range
