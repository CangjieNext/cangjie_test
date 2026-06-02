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
    var a = if (let a <- 1) {
        0
    } else {
        'a'
    }
    var res = match (a) {
        case x: Int64 => 0
        case _ => 1
    }
    return res
}
// ASSERT: scan sema_diag_report_error_message
