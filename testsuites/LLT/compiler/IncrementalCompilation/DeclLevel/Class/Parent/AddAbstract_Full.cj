// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan A 7default1AC AddAbstract_Full.old.cj 1: srcuse 
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:A in file AddAbstract_Full.old.cj in line 1 in column 16
// ASSERT: scan the changed decl after Spreading is:main in file AddAbstract_Full.old.cj in line 2 in column 1
// ASSERT: scan error: abstract class 'A' can not be instantiated

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
