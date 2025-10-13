// DEPENDENCE: %n.old.cj %n.new.cj %n.p2.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.p2.cj %compile_lib_opt -o libp2.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %f libp2.%lib_extension libp1.%lib_extension -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.p2.cj %compile_lib_opt -o libp2.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f libp2.%lib_extension libp1.%lib_extension -o %output 2>&1 | compare %f

// ASSERT: scan no raw modified decls
// ASSERT: scan incremental compile result kind: no change

import p2.*

main() {
    let b = B()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
