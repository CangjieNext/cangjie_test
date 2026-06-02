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
    var c2: Array<Rune> = ['A', 'a', 'B', 'b', 'f', 'F']

    var s22: String = String(c2)[2..9223372036854775808]

    print(s22 + "\n")

    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_exceed_num_value_range
