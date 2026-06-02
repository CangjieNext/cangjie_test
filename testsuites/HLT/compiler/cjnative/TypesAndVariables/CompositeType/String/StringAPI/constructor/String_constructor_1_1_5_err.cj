/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func run(): Int64 {
    var c6: Array<Rune> = ['仓', '颉', 'b', 'f', 'F', '3', '7', '9']
    //报错，比边界值9223372036854775808大1
    var s6: String = String(c6)[9223372036854775809..]

    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_exceed_num_value_range
