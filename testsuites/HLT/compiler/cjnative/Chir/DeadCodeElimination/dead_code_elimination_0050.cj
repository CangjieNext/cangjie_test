/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2) EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (not O2) RUN-EXEC-PIPE: %run %run_opt %output %run_args

func test1() {
    if ((return 0) && true) {
        return 1
    } else {
        return 3
    }
    return 2
}

func test2() {
    if (true && (return 0)) {
        return 1
    }
    return 2
}

func test3() {
    if (false && (return 1)) {
        return 2
    }
    return 0
}

func test4() {
    if ((return 0) && (return 1)) {
        return 2
    }
    return 3
}

func test5() {
    if ((return 0) || true) {
        return 1
    }
    return 2
}

func test6() {
    if (true || (return 1)) {
        return 0
    }
    return 2
}

func test7() {
    if (false || (return 0)) {
        return 1
    }
    return 2
}

func test8() {
    if ((return 0) || (return 1)) {
        return 2
    }
    return 3
}

main() {
    return test1() + test2() + test3() + test4() + test5() + test6() + test7() + test8()
}
// ASSERT: scan chir_dce_unreachable_expression_hint
