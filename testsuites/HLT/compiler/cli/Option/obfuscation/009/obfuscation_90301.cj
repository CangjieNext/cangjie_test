/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// (not O2) EXEC: %compiler %cmp_opt %compile_lib_opt %obf_layout --obf-sym-prefix A --obf-sym-output-mapping A.map pkg/pkga.cj -o pkga.%middle
// (not O2) EXEC: %compiler %cmp_opt %obf_layout --obf-sym-input-mapping A.map %f pkga.%middle -o %output
// (not O2) RUN-EXEC: %run %run_opt %output %run_args
// (not O2) EXEC: cat default.obf.map | compare %f
// ASSERT: regex .*p1.*test_a.*
// ASSERT: regex .*p1.*global_a.*
// ASSERT: regex .*default.*test_default.*
// ASSERT: regex .*default.*global_default.*
// (not iOS) ASSERT: regex .*default.*<main>.*
// (iOS) ASSERT: regex .*default.*cj_main.*

import p1.*

public var global_default: Int64 = 1

public func test_default() {
}

main() {
    print(global_a)
    print(global_default)
    test_a()
    test_default()
    return 0
}
