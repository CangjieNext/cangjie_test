/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 0

class test {
    public static var iii: Int32 = 99
    public static var jjj: Int32 = 11
}

class testclinit {
    public static var xxx: Int32 = 33
}

main(): Int64 {
    test.iii = testclinit.xxx
    test.jjj = 15
    print((0).toString())
    return 0
}
