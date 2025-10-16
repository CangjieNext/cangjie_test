// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan M 7default1MC MemberOrder.old.cj 57: 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1MC1MYi!L1b: body 
// ASSERT: scan          7default1MC1aV$$l: body 
// ASSERT: scan F 7default1FS MemberOrder.old.cj 23: 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1FS1aV$$i: body 
// ASSERT: scan          7default1FS1bV$$i: body 
// ASSERT: scan J 7default1JC MemberOrder.old.cj 38: 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1bP1JC3getF$$i: body 
// ASSERT: scan G 7default1GC MemberOrder.old.cj 28: 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1GC3barF$$l: body 
// ASSERT: scan E 7default1ES MemberOrder.old.cj 18: memory 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1ES1aV$$i: body 
// ASSERT: scan          7default1ES1bV$$i: body 
// ASSERT: scan B 7default1BC MemberOrder.old.cj 8: virtual 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1BC3barF$$i: body 
// ASSERT: scan          7default1BC3fooF$$i: body 
// ASSERT: scan D 7default1DC MemberOrder.old.cj 13: 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1DC1aV$$i: body 
// ASSERT: scan          7default1DC1bV$$l: body 
// ASSERT: scan K 7default1KC MemberOrder.old.cj 45: virtual 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1bP1KC3getF$$i: body 
// ASSERT: scan          7default1KC3fooF$$l: body 
// ASSERT: scan A 7default1AC MemberOrder.old.cj 3: memory 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1AC1aV$$i: body 
// ASSERT: scan          7default1AC1bV$$l: body 
// ASSERT: scan changed decls to recompile: 33
// ASSERT: scan the changed decl after Spreading is:A in file MemberOrder.old.cj in line 3 in column 7
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 4 in column 9
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 5 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file MemberOrder.old.cj in line 8 in column 12
// ASSERT: scan the changed decl after Spreading is:bar in file MemberOrder.old.cj in line 9 in column 22
// ASSERT: scan the changed decl after Spreading is:foo in file MemberOrder.old.cj in line 10 in column 25
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 14 in column 26
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 15 in column 16
// ASSERT: scan the changed decl after Spreading is:E in file MemberOrder.old.cj in line 18 in column 8
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 19 in column 17
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 20 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 24 in column 23
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 25 in column 16
// ASSERT: scan the changed decl after Spreading is:G in file MemberOrder.old.cj in line 28 in column 16
// ASSERT: scan the changed decl after Spreading is:bar in file MemberOrder.old.cj in line 29 in column 22
// ASSERT: scan the changed decl after Spreading is:foo in file MemberOrder.old.cj in line 30 in column 20
// ASSERT: scan the changed decl after Spreading is:H in file MemberOrder.old.cj in line 33 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 34 in column 17
// ASSERT: scan the changed decl after Spreading is:r in file MemberOrder.old.cj in line 35 in column 17
// ASSERT: scan the changed decl after Spreading is:J in file MemberOrder.old.cj in line 38 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 39 in column 25
// ASSERT: scan the changed decl after Spreading is:get in file MemberOrder.old.cj in line 40 in column 9
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 42 in column 21
// ASSERT: scan the changed decl after Spreading is:K in file MemberOrder.old.cj in line 45 in column 12
// ASSERT: scan the changed decl after Spreading is:foo in file MemberOrder.old.cj in line 46 in column 22
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 47 in column 22
// ASSERT: scan the changed decl after Spreading is:get in file MemberOrder.old.cj in line 48 in column 9
// ASSERT: scan the changed decl after Spreading is:L in file MemberOrder.old.cj in line 52 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 53 in column 22
// ASSERT: scan the changed decl after Spreading is:foo in file MemberOrder.old.cj in line 54 in column 22
// ASSERT: scan the changed decl after Spreading is:M in file MemberOrder.old.cj in line 58 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file MemberOrder.old.cj in line 58 in column 11
// ASSERT: scan the changed decl after Spreading is:a in file MemberOrder.old.cj in line 59 in column 9
// EXEC: %run %run_opt %output %run_arg


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
