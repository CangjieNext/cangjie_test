/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: test_b.cj
// (not iOS) EXEC: %compiler %cmp_opt test_b.cj %compile_lib_opt -o test.%middle
// (not iOS) EXEC: %compiler %cmp_opt %f test.%middle -o %output
// (not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// ASSERT: regex file_global_init|test_b
// ASSERT: scan test_b.cj:11

package My_Test

import test_b.*

main() {
    var x = 0
    return 0
}
