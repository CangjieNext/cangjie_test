/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// EXEC: %touch default.obf.map
// (not OHOS)ERRCHECK: %cjtrace_recover -f stack_obf.log -m default.obf.map
// (not OHOS)ASSERT: scan The buffer is empty.
// (not OHOS)ASSERT: scan Error: failed to read file 'default.obf.map'

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
