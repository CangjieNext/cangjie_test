// DEPENDENCE: Extend1.old.cj Extend1.new.cj %n.up.cj
// EXEC: %compiler %n.up.cj %compile_lib_opt -o libp1.a
// EXEC: %compiler %incrementalCompile %cmp_opt Extend1.old.cj %compile_lib_opt -o libp2.a
// EXEC: %compiler %incrementalCompile %cmp_opt %f libp2.a libp1.a -o %output
// EXEC: %cpfile Extend1.new.cj Extend1.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt Extend1.old.cj %compile_lib_opt -o libp2.a
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f libp2.a -o %output | compare %f
// RUN-EXEC: %run %run_opt %output %run_args


import p2.*

main() {
    let b: CString = unsafe {LibC.mallocCString("fa")}
    let c: Any = b
    0
}

public func jar() {
    foo()
}

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:main in file ExtendCString.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file c_string_resource.cj
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:7CString<:1IX
// ASSERT: scan the deleted decl is:2p21AC6<init>F1I$$
// ASSERT: scan the deleted decl is:2p11II
// ASSERT: scan the deleted decl is:2p11II4testF$$Unit


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
