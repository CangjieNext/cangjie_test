// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan B 7default1BC NoParent_AddParent_Full.old.cj 2: sig 
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:B in file NoParent_AddParent_Full.old.cj in line 2 in column 7
// ASSERT: scan the changed decl after Spreading is:init in file NoParent_AddParent_Full.old.cj in line 3 in column 5
// ASSERT: scan the changed decl after Spreading is:main in file NoParent_AddParent_Full.old.cj in line 6 in column 1
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
