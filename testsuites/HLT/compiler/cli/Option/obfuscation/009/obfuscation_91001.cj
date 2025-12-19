/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: map
// EXEC: %compiler %cmp_opt %obf_layout --obf-apply-mapping-file map/obf1.map %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: cat default.obf.map | compare %f
// ASSERT: regex .*default.*test_default.*newobf_func.*
// ASSERT: regex .*default.*global_default.*newobf_var.*
// (not iOS) ASSERT: regex .*default.*<main>.*newobf_main.*
// (iOS) ASSERT: regex .*default.*cj_main.*newobf_main.*

public var global_default: Int64 = 1

public func test_default() {
    print(1)
    print(2)
}

main() {
    print(global_default)
    test_default()
    test_default()
    return 0
}
