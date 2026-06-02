/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: api_test_logic.cj
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt  %f api_test_logic.cj -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args

main(): Int64 {
    var init1 = JsonString("absd")
    var cases = Testjsonstring()
    if (cases.testinit(init1, "absd", "\"absd\"", "\"absd\"") != 0) {
        println("case 1")
        return 1
    }
    return 0
}
