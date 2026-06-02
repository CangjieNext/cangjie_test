// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 97
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 5111
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 1111
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 2000


func foo() {
    var a: Int64 = 9000
    var b: Int64 = 7000
    var c = a - b
}

func goo() {
    var a: Int32 = 2222
    var b: Int32 = 1111
    var c = a - b
}

func hoo() {
    var a: Int16 = 11111
    var b: Int16 = 6000
    var c = a - b
}

func koo() {
    var a: Int8 = 100
    var b: Int8 = 3
    var c = a - b
}

main(): Int64 {
    0
}
