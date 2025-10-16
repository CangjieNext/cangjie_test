// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 14
// ASSERT: scan the changed decl after Spreading is:main in file InterfaceExtend0to1_CPointer.old.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file InterfaceExtend0to1_CPointer.old.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file InterfaceExtend0to1_CPointer.old.cj in line 11 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:isNull in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:isNotNull in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:toUIntNative in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:read in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:write in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:read in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:write in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:+ in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:- in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:asResource in file c_pointer_resource.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
