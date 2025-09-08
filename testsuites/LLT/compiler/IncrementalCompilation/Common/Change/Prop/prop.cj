// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan B 7default1BC prop.old.cj 14: 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default3barP1BC3getF$$l: body 
// ASSERT: scan          7default1BC3karP: sig 
// ASSERT: scan C 7default1CC prop.old.cj 25: 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1CC3go1F$$u: sig body 
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:kar in file prop.old.cj in line 15 in column 22
// ASSERT: scan the changed decl after Spreading is:get in file prop.old.cj in line 16 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file prop.old.cj in line 20 in column 9
// ASSERT: scan the changed decl after Spreading is:go1 in file prop.old.cj in line 26 in column 18


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
