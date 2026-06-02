// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1

internal import std.reflect.*

main() {
    var ti = (TypeInfo.of<C>() as ClassTypeInfo).getOrThrow()
    println(ti.sealedSubclasses.size)
    return 0
}

abstract sealed class C {}

/* SCAN
1
*/
