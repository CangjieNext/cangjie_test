// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

@C
public struct S {}

@C
public struct S1 {
    var x: Float64 = 2.33
}

struct test4 {
    public var cFunc1: CFunc<(S, S1) -> Float64> = {s: S, s1: S1 => s1.x}
}

main() {
    var ret = unsafe { test4().cFunc1(S(), S1()) }
    if (ret != 2.33) {
        return 1
    }
    return 0
    0
}
