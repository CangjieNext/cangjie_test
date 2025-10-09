/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not g) EXEC: %compiler %cmp_opt %obf_layout %f -o %output
// (not g) RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (not g) ERRCHECK: %cjtrace_recover -f stack_obf.log -m
// (not g) ASSERT: scan Please specific mapping file with option '-m'

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
