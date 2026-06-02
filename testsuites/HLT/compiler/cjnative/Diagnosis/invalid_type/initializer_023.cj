/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a: Array<Int32> = [1.0]
var b: Array<Int32> = [[1.0]][0]

main() {
    return 1
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_mismatched_types
