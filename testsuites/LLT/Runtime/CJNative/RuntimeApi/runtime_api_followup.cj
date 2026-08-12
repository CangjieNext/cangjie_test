// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c runtime_api_plain.c runtime_api_test.h
// (not Windows) EXEC: %compiler %cmp_opt %compile_shared_lib_opt %f -o lib%n.%dylib_suffix
// (not Windows) EXEC: %clang %clang_shared_opt runtime_api_plain.c -o libruntime_api_plain.%dylib_suffix
// (not Windows) EXEC: %clang -std=c11 %n.c %cffi_runtime_link -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output core %run_args 2>&1 | compare %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output ui %run_args 2>&1 | compare %f
// ASSERT: scan runtime api followup pass

import std.time.*

@C
struct RuntimeApiTlsPayload {
    var key: UInt32 = 0
    var value: CPointer<Unit> = CPointer<Unit>()
}

foreign func CJThreadSetspecific(key: UInt32, value: CPointer<Unit>): Int32
foreign func CJThreadGetspecific(key: UInt32): CPointer<Unit>

@C
public func RuntimeApiFollowupImmediate(arg: CPointer<Unit>): CPointer<Unit> {
    return arg
}

@C
public func RuntimeApiFollowupSlow(arg: CPointer<Unit>): CPointer<Unit> {
    sleep(20 * Duration.millisecond)
    return arg
}

@C
public func RuntimeApiFollowupTls(arg: CPointer<Unit>): CPointer<Unit> {
    let payload = unsafe { CPointer<RuntimeApiTlsPayload>(arg).read() }
    if (unsafe { CJThreadSetspecific(payload.key, payload.value) } != 0) {
        return CPointer<Unit>()
    }
    return unsafe { CJThreadGetspecific(payload.key) }
}
