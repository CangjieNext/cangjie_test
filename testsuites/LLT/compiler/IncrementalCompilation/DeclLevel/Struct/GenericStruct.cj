// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f

// ASSERT: scan A 7default1A<1>S GenericStruct.old.cj 5: memory 
// ASSERT: scan     added members 1: 7default1A<1>S1aV$$i 
// ASSERT: scan     deleted members 2: 7default1A<1>S1aP 7default1aP1A<1>S3getF$$l 
// ASSERT: scan A2 7default2A2<1>S GenericStruct.old.cj 11: 
// ASSERT: scan     changed members 2:
// ASSERT: scan          7default1aP2A2<1>S3getF$$l: body 
// ASSERT: scan          7default1aP2A2<1>S3setF$$l: body 
// ASSERT: scan A3 7default2A3<1>S GenericStruct.old.cj 18: 
// ASSERT: scan     deleted members 1: 7default2v1P2A3<1>S3setF$$6String 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default2A3<1>S2v1P: srcuse 
// ASSERT: scan A4 7default2A4<1>S GenericStruct.old.cj 25: body 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default2A4<1>S3jom<1G>F$$: body 
// ASSERT: scan changed decls to recompile: 15
// ASSERT: scan the changed decl after Spreading is:A in file GenericStruct.old.cj in line 5 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file GenericStruct.old.cj in line 8 in column 9
// ASSERT: scan the changed decl after Spreading is:A2 in file GenericStruct.old.cj in line 11 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file GenericStruct.old.cj in line 12 in column 14
// ASSERT: scan the changed decl after Spreading is:set in file GenericStruct.old.cj in line 13 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file GenericStruct.old.cj in line 14 in column 9
// ASSERT: scan the changed decl after Spreading is:A3 in file GenericStruct.old.cj in line 18 in column 8
// ASSERT: scan the changed decl after Spreading is:v1 in file GenericStruct.old.cj in line 19 in column 11
// ASSERT: scan the changed decl after Spreading is:get in file GenericStruct.old.cj in line 21 in column 9
// ASSERT: scan the changed decl after Spreading is:A4 in file GenericStruct.old.cj in line 25 in column 8
// ASSERT: scan the changed decl after Spreading is:jom in file GenericStruct.old.cj in line 26 in column 17
// ASSERT: scan the changed decl after Spreading is:u1 in file GenericStruct.old.cj in line 32 in column 6
// ASSERT: scan the changed decl after Spreading is:u2 in file GenericStruct.old.cj in line 37 in column 6
// ASSERT: scan the changed decl after Spreading is:u3 in file GenericStruct.old.cj in line 43 in column 6
// ASSERT: scan the changed decl after Spreading is:u4 in file GenericStruct.old.cj in line 48 in column 6


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
