// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var res1: ?((Range<UInt8>, Unit, ((UInt64, ((Range<Int64>, Float32, Int32, Bool, UInt32, Float32)), Float64, Int8, 
                Float32, Range<Int64>)), Array<Range<Int32>>)) = Option<((Range<UInt8>, Unit, ((UInt64, ((Range<Int64>, 
                        Float32, Int32, Bool, UInt32, Float32)), Float64, Int8, Float32, Range<Int64>)), Array<Range<Int32>>))>
        .None;
    return 0
}
