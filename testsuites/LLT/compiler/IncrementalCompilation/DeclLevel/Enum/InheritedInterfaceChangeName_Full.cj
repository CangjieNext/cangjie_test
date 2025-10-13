// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan B 7default1B<1>U InheritedInterfaceChangeName_Full.old.cj 3: sig 
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:B in file InheritedInterfaceChangeName_Full.old.cj in line 3 in column 6
// ASSERT: scan the changed decl after Spreading is:A in file InheritedInterfaceChangeName_Full.old.cj in line 4 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file InheritedInterfaceChangeName_Full.old.cj in line 6 in column 24
// ASSERT: scan the changed decl after Spreading is:a in file InheritedInterfaceChangeName_Full.old.cj in line 9 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file InheritedInterfaceChangeName_Full.old.cj in line 11 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file InheritedInterfaceChangeName_Full.old.cj in line 15 in column 1
// EXEC-1: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
