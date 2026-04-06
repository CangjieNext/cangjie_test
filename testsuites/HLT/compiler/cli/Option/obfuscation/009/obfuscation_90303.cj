/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %touch A.map
// (not O2) EXEC: %compiler %cmp_opt %obf_layout --obf-sym-input-mapping A.map %f -o %output
// (not O2) RUN-EXEC: %run %run_opt %output %run_args
// (not O2) EXEC: cat default.obf.map | compare %f
// ASSERT: regex .*default.*test_default.*
// ASSERT: regex .*default.*global_default.*
// (not iOS) ASSERT: regex .*default.*<main>.*
// (iOS) ASSERT: regex .*default.*cj_main.*

public var global_default: Int64 = 1

public func test_default() {
}

main() {
    print(global_default)
    test_default()
    return 0
}
