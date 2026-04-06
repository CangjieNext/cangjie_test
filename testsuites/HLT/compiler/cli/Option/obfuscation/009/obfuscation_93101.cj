/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) EXEC: %compiler %cmp_opt %obf_layout %f -o %output
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) RUN-EXEC: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ERRCHECK: %cjtrace_recover -f stack_obf.log -m default.obf.map
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: scan The buffer is empty.
// (!g & !target_ohos & !target_android & !target_ios & !target_ios_simulator) ASSERT: scan Error: failed to read file 'stack_obf.log'

class A {
    var a = 1
}

func test() {
    var a = 1 / A().a
    a
}

main() {
    test()
    return 0
}