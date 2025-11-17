/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %obf_string %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %cmp_opt %f -o %output_no_obf
// cannot find.
// RUN-EXEC-1: strings %output | grep TEST_FOR_OBF_STRING
// can find.
// RUN-EXEC: strings %output_no_obf | grep TEST_FOR_OBF_STRING

main() {
    var a = "TEST_FOR_OBF_STRING"
    println(a)
    return 0
}
