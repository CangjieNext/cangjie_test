/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not g) EXEC: %compiler %cmp_opt %obf_layout %obf_line_number %f -o %output
// (not g) RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (not g and not MAC and not OHOS) EXEC: %sed -i "s/(/a(/g" stack_obf.log
// (MAC and not OHOS) EXEC: %sed -i "" "s/(/a(/g" stack_obf.log
// (not g and not OHOS) EXEC-PIPE: %cjtrace_recover -f stack_obf.log -m default.obf.map 2>&1 | compare %f
// (not g and not OHOS) ASSERT: regex ArithmeticException: Divided by zero!
// (not g and not OHOS) ASSERT: regex a\(SOURCE:0\)
// (not g and not OHOS) ASSERT: regex-not at default\.test.*obfuscation.*
// (not g and not OHOS) ASSERT: regex-not at default\.main.*obfuscation.*

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
