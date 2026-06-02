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
    var a: Bool = true
    var i: Int64 = 1
    var y: Int64 = match (i) {
        case _ where (Array<Int32>()) => i
    }
    return y - 1
}
// ASSERT: scan sema_mismatched_types
