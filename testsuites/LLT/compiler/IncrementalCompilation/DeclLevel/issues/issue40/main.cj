// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output -O2
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output -O2 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 18
// ASSERT: scan the changed decl after Spreading is:d in file main.old.cj in line 10 in column 5
// ASSERT: scan the changed decl after Spreading is:a in file main.old.cj in line 12 in column 5


// ASSERT: scan the changed decl after Spreading is:get in file main.old.cj in line 16 in column 9
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file main.old.cj in line 21 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file main.old.cj in line 22 in column 21
// ASSERT: scan the changed decl after Spreading is:get in file main.old.cj in line 23 in column 13
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj


// ASSERT: scan the changed decl after Spreading is:get in file main.old.cj in line 32 in column 17
// ASSERT: scan the changed decl after Spreading is:set in file main.old.cj in line 35 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj

// ASSERT: scan the changed decl after Spreading is:main in file main.old.cj in line 42 in column 13
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file duration.cj
// ASSERT: scan deleted decls: 2
// ASSERT: scan the deleted decl is:i<:2TIX
// ASSERT: scan the deleted decl is:7default7Extend!i<:2TIX1bP

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
