// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 %dumpCHIRDebug | compare %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %n.new.cj

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A in file DeleteExtendMethod3.old.cj in line 5 in column 12
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DeleteExtendMethod3.old.cj in line 9 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file DeleteExtendMethod3.old.cj in line 13 in column 7
// ASSERT: scan the changed decl after Spreading is:main in file DeleteExtendMethod3.old.cj in line 15 in column 1
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default7Extend!1A<:2I1X3fooF$$


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
