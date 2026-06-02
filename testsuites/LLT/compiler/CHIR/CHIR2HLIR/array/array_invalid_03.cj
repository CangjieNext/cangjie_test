// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f

var g_arr: Array<Array<Int64>> = Array<Array<Int64>>()
var g_arr2: Array<Array<Array<Array<Array<Int64>>>>> = Array<Array<Array>> > ([g_arr])

main() {
    return 0
}
// ASSERT: scan sema_generic_type_without_type_argument
