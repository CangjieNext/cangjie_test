// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 %dumpCHIRDebug | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan deleted 7default7Extend!l<:X3gooF$$
// ASSERT: scan deleted l<:X
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DeleteExtendOnPrimitiveType.old.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file duration.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
