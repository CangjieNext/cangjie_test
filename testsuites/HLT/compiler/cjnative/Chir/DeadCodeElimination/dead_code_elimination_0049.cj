/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-6 chir_dce_unreachable_expression_hint
// RUN-EXEC: %run %run_opt %output %run_args

func test1() {
    (return 0) && true
    return 1
}

func test2() {
    true && (return 0)
    return 1
}

func test3() {
    (return 0) && (return 1)
    return 2
}

func test4() {
    (return 0) || false
    return 1
}

func test5() {
    false || (return 0)
    return 1
}

func test6() {
    (return 0) || (return 1)
    return 2
}

main() {
    return test1() + test2() + test3() + test4() + test5() + test6()
}
