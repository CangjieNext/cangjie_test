// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output -O2
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output -O2 2>&1 | compare %f
// EXEC-2: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:A in file ChangeVar.old.cj in line 1 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file ChangeVar.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file ChangeVar.old.cj in line 4 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file ChangeVar.old.cj in line 5 in column 9
// ASSERT: scan the changed decl after Spreading is:gb in file ChangeVar.old.cj in line 8 in column 5
// ASSERT: scan the changed decl after Spreading is:u1 in file ChangeVar.old.cj in line 10 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file ChangeVar.old.cj in line 14 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
