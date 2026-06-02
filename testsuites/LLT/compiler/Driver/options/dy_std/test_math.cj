// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f --dy-std --dy-libs -o %output
//  EXEC-3: %output 2>&1
//  EXEC: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan cangjie-std-math.so
// (Darwin and CJNATIVE) ASSERT: scan cangjie-std-math.dylib
// (Windows and CJNATIVE) ASSERT: scan cangjie-std-math.dll

internal import std.math.*

main() {
    let x: Int64 = Int64(Float64.GetPI())
    return x
}
