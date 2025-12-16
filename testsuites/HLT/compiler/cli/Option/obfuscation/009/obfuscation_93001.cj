/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2 and not g) EXEC: %compiler %cmp_opt %obf_layout %f -o %output
// (not O2 and not g and not iOS) RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (not O2 and not g and not OHOS and not iOS) EXEC-PIPE: %cjtrace_recover -f stack_obf.log -m default.obf.map 2>&1 | compare %f
// (not O2 and not g and not OHOS) ASSERT: regex ArithmeticException: Divided by zero!
// (not O2 and not g and not OHOS) ASSERT: regex at default\.test.*obfuscation.*
// (not O2 and not g and not OHOS) ASSERT: regex at default\.main.*obfuscation.*

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
