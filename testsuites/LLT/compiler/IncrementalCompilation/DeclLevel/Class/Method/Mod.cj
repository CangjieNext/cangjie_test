// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 50
// ASSERT: scan the changed decl after Spreading is:A in file Mod.old.cj in line 1 in column 19
// ASSERT: scan the changed decl after Spreading is:a in file Mod.old.cj in line 3 in column 10
// ASSERT: scan the changed decl after Spreading is:b in file Mod.old.cj in line 5 in column 10
// ASSERT: scan the changed decl after Spreading is:c in file Mod.old.cj in line 7 in column 10
// ASSERT: scan the changed decl after Spreading is:d in file Mod.old.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:e in file Mod.old.cj in line 11 in column 10
// ASSERT: scan the changed decl after Spreading is:g in file Mod.old.cj in line 15 in column 10
// ASSERT: scan the changed decl after Spreading is:h in file Mod.old.cj in line 17 in column 10
// ASSERT: scan the changed decl after Spreading is:i in file Mod.old.cj in line 19 in column 10
// ASSERT: scan the changed decl after Spreading is:pa in file Mod.old.cj in line 25 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 26 in column 9
// ASSERT: scan the changed decl after Spreading is:pb in file Mod.old.cj in line 29 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 30 in column 9
// ASSERT: scan the changed decl after Spreading is:pc in file Mod.old.cj in line 33 in column 14
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 34 in column 9
// ASSERT: scan the changed decl after Spreading is:set in file Mod.old.cj in line 35 in column 9
// ASSERT: scan the changed decl after Spreading is:pd in file Mod.old.cj in line 38 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 39 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file Mod.old.cj in line 43 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file Mod.old.cj in line 45 in column 15
// ASSERT: scan the changed decl after Spreading is:pa in file Mod.old.cj in line 47 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 48 in column 9
// ASSERT: scan the changed decl after Spreading is:pb in file Mod.old.cj in line 51 in column 15
// ASSERT: scan the changed decl after Spreading is:CC in file Mod.old.cj in line 54 in column 7
// ASSERT: scan the changed decl after Spreading is:h in file Mod.old.cj in line 57 in column 10
// ASSERT: scan the changed decl after Spreading is:i in file Mod.old.cj in line 61 in column 10
// ASSERT: scan the changed decl after Spreading is:pd in file Mod.old.cj in line 63 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 64 in column 9
// ASSERT: scan the changed decl after Spreading is:SB in file Mod.old.cj in line 68 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file Mod.old.cj in line 70 in column 10
// ASSERT: scan the changed decl after Spreading is:pa in file Mod.old.cj in line 72 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 73 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file Mod.old.cj in line 75 in column 21
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 76 in column 9
// ASSERT: scan the changed decl after Spreading is:set in file Mod.old.cj in line 77 in column 9
// ASSERT: scan the changed decl after Spreading is:init in file Mod.old.cj in line 80 in column 5
// ASSERT: scan the changed decl after Spreading is:C in file Mod.old.cj in line 83 in column 11
// ASSERT: scan the changed decl after Spreading is:a in file Mod.old.cj in line 85 in column 10
// ASSERT: scan the changed decl after Spreading is:D in file Mod.old.cj in line 92 in column 6
// ASSERT: scan the changed decl after Spreading is:ra in file Mod.old.cj in line 96 in column 10
// ASSERT: scan the changed decl after Spreading is:rb in file Mod.old.cj in line 98 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 99 in column 9
// ASSERT: scan the changed decl after Spreading is:rc in file Mod.old.cj in line 102 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 103 in column 9
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file Mod.old.cj in line 107 in column 1
// ASSERT: scan the changed decl after Spreading is:f in file Mod.old.cj in line 109 in column 10
// ASSERT: scan the changed decl after Spreading is:pb in file Mod.old.cj in line 111 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Mod.old.cj in line 112 in column 9
// ASSERT: scan the changed decl after Spreading is:f in file Mod.old.cj in line 119 in column 10
// ASSERT: scan the changed decl after Spreading is:main in file Mod.old.cj in line 123 in column 1
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default2SBS6<init>F$$
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
