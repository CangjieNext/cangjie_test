// DEPENDENCE: %n.old.cj %n.new.cj %n.up.cj
// EXEC: %compiler %n.up.cj %compile_lib_opt -o libp1.a
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp2.a
// EXEC: %compiler %incrementalCompile %cmp_opt %f libp2.a libp1.a -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp2.a
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f libp2.a -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args


import p2.*
import std.collection.*

main() {
    let b: ArrayList<Int64> = ArrayList<Int64>(1)
    let c: Any = b
    0
}

public func jar() {
    foo()
}

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan deleted 2p11II
// ASSERT: scan deleted 2p11II4testF$$Unit
// ASSERT: scan deleted 9ArrayList<1T><:1IX
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:main in file ExtendGeneric.cj in line 14 in column 1
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:9ArrayList<1T><:1IX
// ASSERT: scan the deleted decl is:2p21AC6<init>F1I$$
// ASSERT: scan the deleted decl is:2p11II
// ASSERT: scan the deleted decl is:2p11II4testF$$Unit


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
