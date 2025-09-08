// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.inc.cj -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan A 7default1AC MoveMemberParamOut.inc.cj 1: memory 
// ASSERT: scan     added members 2: 7default1AC1AYl 7default1AC1vV$$l 
// ASSERT: scan     deleted members 2: 7default1AC1AYl!V1v 7default1AC1v$$l 
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file MoveMemberParamOut.inc.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:A in file MoveMemberParamOut.inc.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:v in file MoveMemberParamOut.inc.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:foo in file MoveMemberParamOut.inc.cj in line 6 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file MoveMemberParamOut.inc.cj in line 10 in column 1
// EXEC-1: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
