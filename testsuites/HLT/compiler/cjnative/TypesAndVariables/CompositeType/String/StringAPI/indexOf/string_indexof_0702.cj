/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

func run(): Int64 {
    var s: String = "indexOf Test fff"
    var ch1: Rune = 'f'
    var i1: Int64 = s.indexOf(ch1, 18446744073709551615) ?? -1

    print("s = " + s + "\n")
    print("indexOf('f',  18446744073709551615)=" + Int32(i1).toString() + "\n")

    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
