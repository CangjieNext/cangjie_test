// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC-2: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:A in file AddPubInstanceProp.old.cj in line 1 in column 12
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddPubInstanceProp.old.cj in line 2 in column 1
// ASSERT: scan the changed decl after Spreading is:k in file AddPubInstanceProp.old.cj in line 3 in column 17
// ASSERT: scan the changed decl after Spreading is:get in file AddPubInstanceProp.old.cj in line 3 in column 28
// ASSERT: scan the changed decl after Spreading is:main in file AddPubInstanceProp.old.cj in line 6 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file AddPubInstanceProp.old.cj in line 11 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddPubInstanceProp.old.cj in line 17 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
