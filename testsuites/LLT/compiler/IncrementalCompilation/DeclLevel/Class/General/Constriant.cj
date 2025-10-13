// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan SB 7default2SB<1>S Constriant.old.cj 19: sig 
// ASSERT: scan SA 7default2SA<3>S Constriant.old.cj 16: sig 
// ASSERT: scan CC 7default2CC<3>C Constriant.old.cj 13: sig 
// ASSERT: scan IC 7default2IC<1>I Constriant.old.cj 28: sig 
// ASSERT: scan SC 7default2SC<2>U Constriant.old.cj 25: sig 
// ASSERT: scan EA 7default2EA<2>U Constriant.old.cj 22: sig 
// ASSERT: scan CB 7default2CB<2>C Constriant.old.cj 10: sig 
// ASSERT: scan CA 7default2CA<2>C Constriant.old.cj 7: sig 
// ASSERT: scan ID 7default2ID<2>I Constriant.old.cj 31: sig 
// ASSERT: scan changed decls to recompile: 10
// ASSERT: scan the changed decl after Spreading is:CA in file Constriant.old.cj in line 7 in column 7
// ASSERT: scan the changed decl after Spreading is:CB in file Constriant.old.cj in line 10 in column 7
// ASSERT: scan the changed decl after Spreading is:CC in file Constriant.old.cj in line 13 in column 12
// ASSERT: scan the changed decl after Spreading is:SA in file Constriant.old.cj in line 16 in column 8
// ASSERT: scan the changed decl after Spreading is:SB in file Constriant.old.cj in line 19 in column 8
// ASSERT: scan the changed decl after Spreading is:EA in file Constriant.old.cj in line 22 in column 6
// ASSERT: scan the changed decl after Spreading is:SC in file Constriant.old.cj in line 25 in column 6
// ASSERT: scan the changed decl after Spreading is:IC in file Constriant.old.cj in line 28 in column 18
// ASSERT: scan the changed decl after Spreading is:ID in file Constriant.old.cj in line 31 in column 11
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file Constriant.old.cj in line 34 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
