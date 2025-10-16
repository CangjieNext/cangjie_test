// EXEC: %compiler %incrementalCompile %n.cj -o %output
// (not Windows) EXEC: %compiler %incrementalCompile %pwd/%n.cj -o %output 2>&1 | compare %f
// (Windows) EXEC: %compiler %incrementalCompile %%cd%\%n.cj -o %output 2>&1 | compare %f

// the body hash differs for relative/absolute path to the source file

main() : Int64 {
    return 0
}

// ASSERT: scan changed decls to recompile: 1
// ASSERT: regex the changed decl after Spreading is:main in file .*diffCompileArgs07\.cj in line 7 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
