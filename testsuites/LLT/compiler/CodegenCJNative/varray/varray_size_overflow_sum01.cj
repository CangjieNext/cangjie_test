// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the sum of multiple stack VArrays exceeding the 2GB stack
// frame limit. N = 201326592, element Int64 (8 bytes): each VArray occupies
// N * 8 = 1.5GB, individually representable in uint64 and individually below
// 2GB, so the IR-level overflow check does not reject them. But the two
// objects share one frame, whose total is 3GB, so the backend stacksize guard
// must reject the function.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The stacksize of default::main() exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var a: VArray<Int64, $201326592> = VArray<Int64, $201326592> {i => i}
    var b: VArray<Int64, $201326592> = VArray<Int64, $201326592> {i => i + 1}
    return a[0] + b[0]
}
