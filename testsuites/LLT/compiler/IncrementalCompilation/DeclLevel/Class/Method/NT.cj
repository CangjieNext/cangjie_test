// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj %enableCompileDebug -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj %enableCompileDebug -o %output 2>&1 | compare %f
// ASSERT: scan the changed decl after Spreading is:a in file NT.old.cj in line 15 in column 10
// ASSERT: scan the changed decl after Spreading is:main in file NT.old.cj in line 20 in column 1
// ASSERT: scan the changed decl after Spreading is:a in file NT.old.cj in line 5 in column 10
// ASSERT: scan the changed decl after Spreading is:b in file NT.old.cj in line 7 in column 10
// ASSERT: scan the changed decl after Spreading is:c in file NT.old.cj in line 8 in column 10
// ASSERT: scan incremental compilation triggered
// EXEC-1: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
