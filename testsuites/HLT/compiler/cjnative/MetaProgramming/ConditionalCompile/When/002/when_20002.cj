/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_20002.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt test_20002.cj -o when.%middle
// EXEC: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt when.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import when.*

@When[TEST == "true"]
main() {
    0
}
