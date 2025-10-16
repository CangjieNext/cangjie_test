// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %f liba.%lib_extension -o %output -O2
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %f liba.%lib_extension -o %output -O2 2>&1 | compare %f

// ASSERT: scan-not the changed decl after Spreading is:bar in file extra_unit.old.cj
// ASSERT: scan-not the changed decl after Spreading is:main in file extra_unit.cj
// ASSERT: scan the changed decl after Spreading is:jar in file extra_unit.cj in line 16 in column 13
// ASSERT: scan the changed decl after Spreading is:too in file extra_unit.old.cj in line 14 in column 13

import a.*

public func jar() {
    too()
}
main() {
    bar(10)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
