/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not g and not OHOS) EXEC: %compiler %cmp_opt %obf_layout %f -o %output
// (not g and not OHOS) RUN-EXEC: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (not g and not OHOS) EXEC-PIPE: %cjtrace_recover -f stack_obf.log -m default.obf.map 2>&1 | compare %f
// (not g and not OHOS) ASSERT: scan test stack trace recover

class A {
    var a = 1
}

func test() {
    var a = 1 / A().a
    a
}

main() {
    test()
    print("test stack trace recover")
    return 0
}
