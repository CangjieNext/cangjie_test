/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_10025.cj
// EXEC: %compiler %cmp_macro %conditional_compilation_config_opt="TEST=true" test_10025.cj
// EXEC: %compiler %cmp_opt %conditional_compilation_config_opt="TEST=true"   %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package foo

import test.*

@When[TEST == "true"]
@M[123]
var x = 0

@When[TEST == "true"]
main() {
    return x
}
