/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The stacksize of default::main() exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var v0: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v1: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v2: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v3: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v4: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v5: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v6: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    var v7: VArray<Int64, $134217728> = VArray<Int64, $134217728> {i => i + 1}
    return v0[0] + v1[0] + v2[0] + v3[0] + v4[0] + v5[0] + v6[0] + v7[0] - 8
}
