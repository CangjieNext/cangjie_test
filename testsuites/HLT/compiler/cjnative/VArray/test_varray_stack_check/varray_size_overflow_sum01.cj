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
    var a: VArray<Int64, $201326592> = VArray<Int64, $201326592> {i => i + 1}
    var b: VArray<Int64, $201326592> = VArray<Int64, $201326592> {i => i + 1}
    return a[0] + b[0] - 2
}
