/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not MAC and not Android)EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not MAC and not Android)RUN-EXEC: %export cjGwpAsanSampleRate=10000000000000000000000000000000000000000 && %export cjEnableGwpAsan=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (not Windows and not MAC and not Android)ASSERT: scan Unsupported cjGwpAsanSampleRate parameter. Valid sample rates range is (0, 2^31 - 1].

unsafe main() {
    let arraySize = 10
    var arr = Array<UInt8>(arraySize, repeat: 1)
    var cph = acquireArrayRawData<UInt8>(arr)
    releaseArrayRawData(cph)
    cph = acquireArrayRawData<UInt8>(arr)
    println(cph.pointer.write(arraySize + 1, 2))
    releaseArrayRawData(cph)
}
