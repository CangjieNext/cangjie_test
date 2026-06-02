// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

@C
struct S {}

@C
struct S1 {
    var x: Int64 = 1
}

main() {
    var cFunc1: CFunc<(S, S1) -> Float64> = {s: S, s1: S1 => 2.33}
    var ret = unsafe { cFunc1(S(), S1()) }
    if (ret != 2.33) {
        return 1
    }
    return 0
}
