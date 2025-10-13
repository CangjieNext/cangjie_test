// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan D 7default1DC AddMod.old.cj 8: srcuse 
// ASSERT: scan I 7default1IC AddMod.old.cj 18: srcuse 
// ASSERT: scan K 7default1KC AddMod.old.cj 25: sig 
// ASSERT: scan B 7default1BC AddMod.old.cj 4: sig 
// ASSERT: scan SE 7default2SES AddMod.old.cj 35: sig 
// ASSERT: scan SG 7default2SGS AddMod.old.cj 37: sig 
// ASSERT: scan A 7default1AC AddMod.old.cj 2: srcuse 
// ASSERT: scan F 7default1FC AddMod.old.cj 12: sig srcuse 
// ASSERT: scan SI 7default2SIS AddMod.old.cj 41: body 
// ASSERT: scan SB 7default2SBS AddMod.old.cj 30: sig 
// ASSERT: scan H 7default1HC AddMod.old.cj 16: sig 
// ASSERT: scan C 7default1CC AddMod.old.cj 6: sig srcuse 
// ASSERT: scan SH 7default2SHS AddMod.old.cj 38: body 
// ASSERT: scan SD 7default2SDS AddMod.old.cj 33: body 
// ASSERT: scan M 7default1MC AddMod.old.cj 20: srcuse 
// ASSERT: scan E 7default1EC AddMod.old.cj 10: srcuse 
// ASSERT: scan G 7default1GC AddMod.old.cj 14: sig 
// ASSERT: scan L 7default1LC AddMod.old.cj 27: srcuse 
// ASSERT: regex-not J .*\d+: (sig|body)
// ASSERT: scan-not sig body 
// ASSERT: scan changed decls to recompile: 18
// ASSERT: scan the changed decl after Spreading is:A in file AddMod.old.cj in line 3 in column 7
// ASSERT: scan the changed decl after Spreading is:B in file AddMod.old.cj in line 5 in column 7
// ASSERT: scan the changed decl after Spreading is:C in file AddMod.old.cj in line 7 in column 7
// ASSERT: scan the changed decl after Spreading is:D in file AddMod.old.cj in line 9 in column 7
// ASSERT: scan the changed decl after Spreading is:E in file AddMod.old.cj in line 11 in column 7
// ASSERT: scan the changed decl after Spreading is:F in file AddMod.old.cj in line 13 in column 7
// ASSERT: scan the changed decl after Spreading is:G in file AddMod.old.cj in line 15 in column 7
// ASSERT: scan the changed decl after Spreading is:H in file AddMod.old.cj in line 17 in column 7
// ASSERT: scan the changed decl after Spreading is:I in file AddMod.old.cj in line 19 in column 7
// ASSERT: scan the changed decl after Spreading is:M in file AddMod.old.cj in line 21 in column 7
// ASSERT: scan the changed decl after Spreading is:K in file AddMod.old.cj in line 25 in column 7
// ASSERT: scan the changed decl after Spreading is:L in file AddMod.old.cj in line 27 in column 7
// ASSERT: scan the changed decl after Spreading is:SB in file AddMod.old.cj in line 31 in column 8
// ASSERT: scan the changed decl after Spreading is:SD in file AddMod.old.cj in line 33 in column 8
// ASSERT: scan the changed decl after Spreading is:SE in file AddMod.old.cj in line 35 in column 8
// ASSERT: scan the changed decl after Spreading is:SG in file AddMod.old.cj in line 37 in column 8
// ASSERT: scan the changed decl after Spreading is:SH in file AddMod.old.cj in line 39 in column 8
// ASSERT: scan the changed decl after Spreading is:SI in file AddMod.old.cj in line 41 in column 8
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
