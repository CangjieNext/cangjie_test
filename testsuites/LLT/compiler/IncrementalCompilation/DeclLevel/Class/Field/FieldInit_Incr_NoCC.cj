// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -Woff unused -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_Incr_NoCC.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_Incr_NoCC.old.cj in line 4 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file FieldInit_Incr_NoCC.old.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_Incr_NoCC.old.cj in line 27 in column 17
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_Incr_NoCC.old.cj in line 25 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file FieldInit_Incr_NoCC.old.cj in line 26 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file FieldInit_Incr_NoCC.old.cj in line 49 in column 23
// ASSERT: scan the changed decl after Spreading is:d in file FieldInit_Incr_NoCC.old.cj in line 28 in column 16
// ASSERT: scan the changed decl after Spreading is:d in file FieldInit_Incr_NoCC.old.cj in line 5 in column 19
// ASSERT: scan the changed decl after Spreading is:a in file FieldInit_Incr_NoCC.old.cj in line 43 in column 9
// ASSERT: scan the changed decl after Spreading is:g in file FieldInit_Incr_NoCC.old.cj in line 50 in column 18
// ASSERT: regex-not init in file FieldInit_Incr_NoCC.old.cj in line 38 in column 12
// ASSERT: regex-not init in file FieldInit_Incr_NoCC.old.cj in line 44
// ASSERT: regex-not init in file FieldInit_Incr_NoCC.old.cj in line 45
// ASSERT: regex-not init in file FieldInit_Incr_NoCC.old.cj in line 49
// EXEC: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
