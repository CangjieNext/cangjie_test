/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows and not MAC and not Android)EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not MAC and not Android)RUN-EXEC: %export cjGwpAsanSampleRate=1 && %export cjEnableGwpAsan=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (not Windows and not MAC and not Android)ASSERT: scan Gwp-Asan sanity check failed on raw array addr
// (not Windows and not MAC and not Android)ASSERT: scan Head canary (array[-1]) mismatch

unsafe main() {
    var arr = Array<UInt8>(10, repeat: 1)
    var cph = acquireArrayRawData<UInt8>(arr)
    var ptr = cph.pointer
    println(ptr.write(-1, 2))
    releaseArrayRawData(cph)
}
