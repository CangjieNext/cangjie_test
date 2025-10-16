// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f

// ASSERT: scan the changed decl after Spreading is:B in file Rec2.old.cj in line 5 in column 8
// ASSERT: scan the changed decl after Spreading is:B in file Rec2.old.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:value in file Rec2.old.cj in line 6 in column 11
// ASSERT: scan the changed decl after Spreading is:main in file Rec2.old.cj in line 9 in column 1
// ASSERT: scan error: cannot convert an integer literal to type 'Struct-A'
// ASSERT: scan value type recursive detected: 'A->B->A'
// ASSERT: scan 2 errors generated, 2 errors printed.


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
