// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 8
// ASSERT: scan the changed decl after Spreading is:A in file Enum_AddOption_Full.old.cj in line 1 in column 6
// ASSERT: scan the changed decl after Spreading is:mem in file Enum_AddOption_Full.old.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:a in file Enum_AddOption_Full.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file Enum_AddOption_Full.old.cj in line 2 in column 11
// ASSERT: scan the changed decl after Spreading is:c in file Enum_AddOption_Full.old.cj in line 2 in column 13
// ASSERT: scan the changed decl after Spreading is:v in file Enum_AddOption_Full.old.cj in line 5 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file Enum_AddOption_Full.old.cj in line 7 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file Enum_AddOption_Full.old.cj in line 11 in column 1
// EXEC-2: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
