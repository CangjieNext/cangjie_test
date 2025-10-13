// DEPENDENCE: %n.old.cj %n.new.cj %n.p1.cj %n.p2.cj
// EXEC: %compiler %n.p1.cj %compile_lib_opt -o libp1.a
// EXEC: %compiler %n.p2.cj %compile_lib_opt libp1.a -o libp2.a
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp3.a
// EXEC: %compiler %incrementalCompile %cmp_opt %f libp3.a libp2.a libp1.a -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp3.a
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f libp3.a libp1.a -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args


import p3.*
import p1.*

main() {
    let b: A<Int64> = A<Int64>()
    let c: Any = b
    0
}

public func jar() {
    foo()
}

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:init in file ExtendGeneric2.p1.cj in line 0 in column 0
// ASSERT: scan the changed decl after Spreading is:A in file ExtendGeneric2.p1.cj in line 3 in column 14
// ASSERT: scan the changed decl after Spreading is:main in file ExtendGeneric2.cj in line 15 in column 1
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:2p21II
// ASSERT: scan the deleted decl is:2p21II4testF$$Unit
// ASSERT: scan the deleted decl is:1A<1T><:1IX
// ASSERT: scan the deleted decl is:2p31BC6<init>F1I$$


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
