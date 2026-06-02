// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var fi8a: Float32 = -128.0
    var fi8b: Float32 = 127.0
    var fi16a: Float32 = -32768.0
    var fi16b: Float32 = 32767.0
    var f32: Float32 = 3.14
    // float->Int64
    var ret3 = Int64(fi8a) + Int64(fi8b) + 1
    if (ret3 != 0) {
        return 1
    }
    var ret4 = Int64(fi16a) + Int64(fi16b) + 1
    if (ret4 != 0) {
        return 2
    }
    var ret5 = Int64(f32)
    if (ret5 != 3) {
        return 3
    }
    return 0
}
