/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %compiler %cmp_opt %obf_layout --obf-sym-output-mapping A.map %f -o %output
// (not O2) RUN-EXEC: %run %run_opt %output %run_args
// (not O2) EXEC: cat A.map | compare %f
// ASSERT: regex .*default.*test.*
// (not iOS) ASSERT: regex .*default.*<main>.*
// (iOS) ASSERT: regex .*default.*cj_main.*

func test() {
    var a = 1
    print(a)
}

main() {
    test()
    return 0
}
