// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %compile_lib_opt %f -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj libp1.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj libp1.%lib_extension -o %output 2>&1 | compare %f

package p1 
public class A {}
public enum B {
    R|K(Int32)

}
public struct C {}

// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtendImportType.old.cj in line 6 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtendImportType.old.cj in line 8 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtendImportType.old.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:A in file AddExtendImportType.cj in line 10 in column 14
// ASSERT: scan the changed decl after Spreading is:B in file AddExtendImportType.cj in line 11 in column 13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
