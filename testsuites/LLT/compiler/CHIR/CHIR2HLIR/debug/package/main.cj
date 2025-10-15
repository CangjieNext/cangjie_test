// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./package1
// EXEC: %compiler %compile_lib_opt -g package1/p1.cj -o p1.%middle
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen -g %f p1.%middle -o %n.%suffix 2>&1 | compare %f
// (Unix) ASSERT: regex DIFile\(filename: "p1\.cj", directory: \".*main_cj
// (Windows) ASSERT: regex DIFile\(filename: "p1\.cj", directory: \".*main_cj

internal import p1.*

main() {
    var varCG1 = C1<Float32>(32.32).width
    var carC1 = C1<Int64>(32, 32)
    test1()
    return 0
}
