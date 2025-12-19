/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not g) EXEC: %compiler %cmp_opt %obf_layout %no_obf_source_path %obf_line_number %f -o %output
// (not g and not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// (not g and iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not g) ASSERT: regex (.*obfuscation_92003.cj:0)
// (not g) ASSERT: scan-not SOURCE

class A {
    var a = 0
}

func test() {
    var a = 1 / A().a
    a
}

main() {
    test()
    return 0
}
