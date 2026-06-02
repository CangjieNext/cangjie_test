// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
//udiv
main(): Int64 {
    var x = UInt8(128) / (UInt8(0))
    println(x)
    return 0;
}
