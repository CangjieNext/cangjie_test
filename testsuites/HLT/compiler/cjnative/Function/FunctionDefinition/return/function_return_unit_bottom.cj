/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != ()) {
        return 1
    }
    if (case02() != ()) {
        return 1
    }
    if (case03() != 1) {
        return 1
    }
    if (case04() != ()) {
        return 1
    }
    return 0
}

// func return is Unit
func case01() {
    return
}

// T0 is Nothing,T1 is Nothing and Unit,so func return is Unit
func case02() {
    return return
}

// T0 is bottom,T1 is Int64,so func return is Int64
func case03() {
    return return 1
}

// To is Unit,because Type of "if-else expression" is Unit
func case04() {
    if (true) {
        return ()
    } else {
        return ()
    }
}
