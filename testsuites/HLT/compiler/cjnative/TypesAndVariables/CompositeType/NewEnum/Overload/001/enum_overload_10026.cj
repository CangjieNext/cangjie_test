/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum E {
    | e(Int64)
    | e(Int64, Int64)
}

var e = {=>}

main(): Int64 {
    //e()
    e(1)
    e(1, 1)
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
