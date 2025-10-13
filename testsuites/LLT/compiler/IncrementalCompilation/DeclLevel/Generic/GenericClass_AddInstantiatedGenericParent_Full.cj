// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-3: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan B 7default1B<1>C GenericClass_AddInstantiatedGenericParent_Full.old.cj 7: sig body
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:B in file GenericClass_AddInstantiatedGenericParent_Full.old.cj in line 7 in column 12
// ASSERT: scan the changed decl after Spreading is:init in file GenericClass_AddInstantiatedGenericParent_Full.old.cj in line 8 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file GenericClass_AddInstantiatedGenericParent_Full.old.cj in line 11 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file GenericClass_AddInstantiatedGenericParent_Full.old.cj in line 13 in column 1
// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
