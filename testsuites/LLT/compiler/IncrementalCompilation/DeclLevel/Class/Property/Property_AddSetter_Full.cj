// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan A 7default1AC Property_AddSetter_Full.old.cj 1: 
// ASSERT: scan     added members 1: 7default1dP1AC3setF$$l 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1AC1dP: srcuse 
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:d in file Property_AddSetter_Full.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file Property_AddSetter_Full.old.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:set in file Property_AddSetter_Full.old.cj in line 4 in column 9
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
