// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %rmdir .cached
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o %n.%lib_extension -Woff unused
// EXEC: %compiler %incrementalCompile %cmp_opt %f %n.%lib_extension -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o %n.%lib_extension -Woff unused
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f %n.%lib_extension -o %output 2>&1 | compare %f
// EXEC-1: %run %run_opt %output %run_args

import p1.*

let a = 1
func dat() {
    let b = 3 + a 
    return b 
}

main() {
    foo()
    Jump<Int32>().a
}

// ASSERT: scan no raw modified decls
// ASSERT: scan incremental compile result kind: no change


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
