// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug --int-overflow wrapping %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    // there was no typeInfo in the Float32(UInt64) TypeCast CHIR node
    var abc = (Float32(UInt32(Int8(-68))) as UInt64)
    0
}
