// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-PIPE: %run %run_opt %output %run_args

// ASSERT: scan the changed decl after Spreading is:init in file BoxAny.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:B in file BoxAny.old.cj in line 2 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file BoxAny.old.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file BoxAny.old.cj in line 7 in column 12
// ASSERT: scan the changed decl after Spreading is:g in file BoxAny.old.cj in line 11 in column 10
// ASSERT: scan the changed decl after Spreading is:get in file BoxAny.old.cj in line 12 in column 9
// ASSERT: scan the changed decl after Spreading is:D2 in file BoxAny.old.cj in line 16 in column 6
// ASSERT: scan the changed decl after Spreading is:R in file BoxAny.old.cj in line 16 in column 10
// ASSERT: scan the changed decl after Spreading is:K in file BoxAny.old.cj in line 16 in column 12
// ASSERT: scan the changed decl after Spreading is:b in file BoxAny.old.cj in line 23 in column 5
// ASSERT: scan the changed decl after Spreading is:d in file BoxAny.old.cj in line 25 in column 5
// ASSERT: scan the changed decl after Spreading is:e in file BoxAny.old.cj in line 26 in column 5

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
