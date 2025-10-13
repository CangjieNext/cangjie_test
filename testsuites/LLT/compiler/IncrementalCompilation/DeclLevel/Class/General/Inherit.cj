// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan SC 7default2SC<3>S Inherit.old.cj 36: sig
// ASSERT: scan CA 7default2CAC Inherit.old.cj 13: sig
// ASSERT: scan SB 7default2SB<2>S Inherit.old.cj 34: sig
// ASSERT: scan IN 7default2IN<2>I Inherit.old.cj 46: sig
// ASSERT: scan IM 7default2IMI Inherit.old.cj 44: sig
// ASSERT: scan EA 7default2EAU Inherit.old.cj 39: sig
// ASSERT: scan CI 7default2CIC Inherit.old.cj 27: sig
// ASSERT: scan CH 7default2CHC Inherit.old.cj 25: sig
// ASSERT: scan EB 7default2EB<1>U Inherit.old.cj 41: sig
// ASSERT: scan CG 7default2CGC Inherit.old.cj 23: sig
// ASSERT: scan CD 7default2CD<3>C Inherit.old.cj 19: sig
// ASSERT: scan CC 7default2CC<2>C Inherit.old.cj 17: sig
// ASSERT: scan CE 7default2CE<3>C Inherit.old.cj 21: sig
// ASSERT: scan SA 7default2SAS Inherit.old.cj 32: sig
// ASSERT: scan CB 7default2CB<1>C Inherit.old.cj 15: sig
// ASSERT: scan changed decls to recompile: 15
// ASSERT: scan the changed decl after Spreading is:CA in file Inherit.old.cj in line 13 in column 7
// ASSERT: scan the changed decl after Spreading is:CB in file Inherit.old.cj in line 15 in column 7
// ASSERT: scan the changed decl after Spreading is:CC in file Inherit.old.cj in line 17 in column 7
// ASSERT: scan the changed decl after Spreading is:CD in file Inherit.old.cj in line 19 in column 7
// ASSERT: scan the changed decl after Spreading is:CE in file Inherit.old.cj in line 21 in column 7
// ASSERT: scan the changed decl after Spreading is:CG in file Inherit.old.cj in line 23 in column 7
// ASSERT: scan the changed decl after Spreading is:CH in file Inherit.old.cj in line 25 in column 7
// ASSERT: scan the changed decl after Spreading is:CI in file Inherit.old.cj in line 27 in column 7
// ASSERT: scan the changed decl after Spreading is:SA in file Inherit.old.cj in line 32 in column 8
// ASSERT: scan the changed decl after Spreading is:SB in file Inherit.old.cj in line 34 in column 8
// ASSERT: scan the changed decl after Spreading is:SC in file Inherit.old.cj in line 36 in column 8
// ASSERT: scan the changed decl after Spreading is:EA in file Inherit.old.cj in line 39 in column 6
// ASSERT: scan the changed decl after Spreading is:EB in file Inherit.old.cj in line 41 in column 6
// ASSERT: scan the changed decl after Spreading is:IM in file Inherit.old.cj in line 44 in column 11
// ASSERT: scan the changed decl after Spreading is:IN in file Inherit.old.cj in line 46 in column 11


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
