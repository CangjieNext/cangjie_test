/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



func foo1(x: Int32): Int8 {
var i: Int8 = 3
if (x > 3:) { 
return i + 1
} else {
return 3 - 1
}
}

main(): Int64 {
var res1: Int8 = foo1(4)
var res2: Int8 = foo1(2)

if (res1 != 4 || res2 != 2) {
return 1
}
return 0
}
// ASSERT: scan parse_expected_operator_or_end
// ASSERT: scan parse_expected_right_delimiter
