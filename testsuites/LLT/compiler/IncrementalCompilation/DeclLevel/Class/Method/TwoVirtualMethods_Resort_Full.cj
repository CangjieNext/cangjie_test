// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan A 7default1AC TwoVirtualMethods_Resort_Full.old.cj 1: virtual
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file TwoVirtualMethods_Resort_Full.old.cj in line 1 in column 12
// ASSERT: scan the changed decl after Spreading is:bar in file TwoVirtualMethods_Resort_Full.old.cj in line 2 in column 22
// ASSERT: scan the changed decl after Spreading is:foo in file TwoVirtualMethods_Resort_Full.old.cj in line 3 in column 22
// ASSERT: scan the changed decl after Spreading is:B in file TwoVirtualMethods_Resort_Full.old.cj in line 5 in column 7
// ASSERT: scan the changed decl after Spreading is:main in file TwoVirtualMethods_Resort_Full.old.cj in line 9 in column 1
// EXEC-2: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
