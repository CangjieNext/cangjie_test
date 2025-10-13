// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -O2 -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -O2 -o %output 2>&1 | compare %f
// EXEC-2: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:p in file ChangeVar2.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:A in file ChangeVar2.old.cj in line 3 in column 5
// ASSERT: scan the changed decl after Spreading is:main in file ChangeVar2.old.cj in line 6 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
