// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex-auto @"$const_cjstring.8mEVjnJYhVq" = private constant %cjStringType { i8 addrspace(1)* addrspacecast (i8* bitcast ({ i8*, i64, [51 x i8] }* @"$const_cjstring_data.7Em131g1N6W" to i8*) to i8 addrspace(1)*), i32 0, i32 3 }
// (CJNATIVE) ASSERT: regex-auto @"$const_cjstring.5zUxKD4hiGl" = private constant %cjStringType { i8 addrspace(1)* addrspacecast (i8* bitcast ({ i8*, i64, [51 x i8] }* @"$const_cjstring_data.7Em131g1N6W" to i8*) to i8 addrspace(1)*), i32 3, i32 5 }
// (CJNATIVE) ASSERT: regex-auto @"$const_cjstring.eOeYIhisqu" = private constant %cjStringType { i8 addrspace(1)* addrspacecast (i8* bitcast ({ i8*, i64, [51 x i8] }* @"$const_cjstring_data.7Em131g1N6W" to i8*) to i8 addrspace(1)*), i32 8, i32 26 }
// (CJNATIVE) ASSERT: regex-auto @"$const_cjstring.5CeEPuGykeB" = private constant %cjStringType { i8 addrspace(1)* addrspacecast (i8* bitcast ({ i8*, i64, [51 x i8] }* @"$const_cjstring_data.7Em131g1N6W" to i8*) to i8 addrspace(1)*), i32 34, i32 17 }
// (CJNATIVE) ASSERT: regex-auto @"$const_cjstring_data.7Em131g1N6W" = private constant { i8*, i64, [51 x i8] } { i8* bitcast (%TypeInfo* @"RawArray<UInt8>.ti" to i8*), i64 51, [51 x i8] c"foobingoAn exception has occurred:    Out of memory" }
// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default1aE
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default1bE
var a: String = "bingo"
var b: String = "foo"

main() {
    println(a)
    println(b)
    return 0
}
