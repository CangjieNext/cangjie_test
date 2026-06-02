/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    var i: Int32 = 0
    match {
        case i == 0 => "0"
    }
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_match_case_must_have_default
