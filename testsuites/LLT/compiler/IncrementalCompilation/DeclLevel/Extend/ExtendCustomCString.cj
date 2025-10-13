// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %f %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

package p1
public class CString {}

extend CString {
    public func foo(a: Int32) {0}
}

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:main in file ExtendCustomCString.old.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ExtendCustomCString.old.cj in line 7 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file ExtendCustomCString.old.cj in line 9 in column 17
// ASSERT: scan the changed decl after Spreading is:CString in file ExtendCustomCString.cj in line 12 in column 14

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
