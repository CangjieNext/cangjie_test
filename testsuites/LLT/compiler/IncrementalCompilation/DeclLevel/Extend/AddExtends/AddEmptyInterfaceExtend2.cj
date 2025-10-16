// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file AddEmptyInterfaceExtend2.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddEmptyInterfaceExtend2.old.cj in line 9 in column 1
// ASSERT: scan the changed decl after Spreading is:use1 in file AddEmptyInterfaceExtend2.old.cj in line 17 in column 6
// ASSERT: scan the changed decl after Spreading is:boxuse in file AddEmptyInterfaceExtend2.old.cj in line 22 in column 6
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddEmptyInterfaceExtend2.old.cj in line 31 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
