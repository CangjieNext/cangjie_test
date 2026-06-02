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
    var s: String = "indexOf indexOf "
    var ch1: Rune = 'n'
    var i1: Int64 = s.indexOf(ch1, -7)
    var ch2: Rune = ' '
    var i2: Int64 = s.indexOf(ch2, -7)

    print("s = " + s + "\n")
    print("indexOf('n', -7)=" + Int32(i1).toString() + "\n")
    print("indexOf(' ', -7)=" + Int32(i2).toString() + "\n")

    if (i1 == 1 && i2 == 7) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
