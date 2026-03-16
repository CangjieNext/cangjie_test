/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!target_ios & !target_ios_simulator) EXEC: %compiler %cmp_opt %f -o %output
// (!target_ios & !target_ios_simulator) RUN-EXEC-1: %run %run_opt %output %run_args > stack_obf.log 2>&1
// (!target_ohos & !target_android & !target_ios & !target_ios_simulator) EXEC: %touch default.obf.map
// (!target_ohos & !target_android & !target_ios & !target_ios_simulator)ERRCHECK: %cjtrace_recover -f stack_obf.log -m default.obf.map
// (!target_ohos & !target_android & !target_ios & !target_ios_simulator)ASSERT: scan The buffer is empty.
// (!target_ohos & !target_android & !target_ios & !target_ios_simulator)ASSERT: scan Error: failed to read file 'default.obf.map'

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
