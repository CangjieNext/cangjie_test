// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %f %n.%lib_extension -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f %n.%lib_extension -o %output | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

internal import p1.*

public interface I1 {
    func foo() {2}
}
public class C <: B & I1 {
}

public class D <: A {}

main() {
    let a = C()
    a.foo()
}

// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file Inherit.old.cj in line 3 in column 19
// ASSERT: scan the changed decl after Spreading is:B in file Inherit.old.cj in line 7 in column 19
// ASSERT: scan the changed decl after Spreading is:C in file Inherit.cj in line 14 in column 14
// ASSERT: scan the changed decl after Spreading is:D in file Inherit.cj in line 17 in column 14
// ASSERT: scan the changed decl after Spreading is:main in file Inherit.cj in line 19 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
