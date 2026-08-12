// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c runtime_api_test.h
// (not Windows) EXEC: %compiler %cmp_opt %compile_shared_lib_opt %f -o lib%n.%dylib_suffix
// (not Windows) EXEC: %clang -std=c11 %n.c %cffi_runtime_link -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime task loader pass

import std.time.*

@C
public func RuntimeApiSlowTask(arg: CPointer<Unit>): CPointer<Unit> {
    sleep(50 * Duration.millisecond)
    return arg
}

@C
public func RuntimeApiImmediateTask(arg: CPointer<Unit>): CPointer<Unit> {
    return arg
}
