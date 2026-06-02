/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!g & !target_ios & !target_ios_simulator) EXEC: %compiler %cmp_opt %obf_layout %obf_line_number %f -o %output
// (!g & !target_ios & !target_ios_simulator) RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator & !host_mac) EXEC: sed -i "/_.*/d" default.obf.map
// (host_mac & !target_ohos & !target_android & !target_ios & !target_ios_simulator) EXEC: sed -i "" "/_.*/d" default.obf.map
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) EXEC-PIPE: %cjtrace_recover -f stack_obf.log -m default.obf.map 2>&1 | compare %f
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: regex ArithmeticException: Divided by zero!
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: regex .*SOURCE:0.*
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: regex-not at default\.test.*obfuscation.*
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: regex-not at default\.main.*obfuscation.*

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
