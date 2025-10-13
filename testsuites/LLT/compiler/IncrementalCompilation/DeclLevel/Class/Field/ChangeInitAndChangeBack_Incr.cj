// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-3: %run %run_opt %output %run_args
// EXEC: %move %n.old.cj %n.3rd.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not rollback
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:b in file ChangeInitAndChangeBack_Incr.old.cj in line 6 in column 9
// ASSERT: scan the changed decl after Spreading is:a in file ChangeInitAndChangeBack_Incr.old.cj in line 2 in column 9
// EXEC-7: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.3rd.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %n.old.cj
// EXEC-3: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
