// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-20: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC-10: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:Derive in file DeleteFunc3.old.cj in line 10 in column 12
// ASSERT: scan the changed decl after Spreading is:fuzz in file DeleteFunc3.old.cj in line 14 in column 22
// ASSERT: scan the changed decl after Spreading is:useDFuzz in file DeleteFunc3.old.cj in line 24 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file DeleteFunc3.old.cj in line 29 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
