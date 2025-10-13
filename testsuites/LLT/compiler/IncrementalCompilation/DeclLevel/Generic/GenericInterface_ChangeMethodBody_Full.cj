// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan I 7default1I<1>I GenericInterface_ChangeMethodBody_Full.old.cj 1:
// ASSERT: scan changed decls to recompile: 9
// ASSERT: scan the changed decl after Spreading is:I in file GenericInterface_ChangeMethodBody_Full.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:foo in file GenericInterface_ChangeMethodBody_Full.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file GenericInterface_ChangeMethodBody_Full.old.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file GenericInterface_ChangeMethodBody_Full.old.cj in line 8 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file duration.cj
// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
