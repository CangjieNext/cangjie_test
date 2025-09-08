// DEPENDENCE: pkg
// EXEC: %compiler %incrementalCompile pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%middle test.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile pkg/pkg.old.cj
// EXEC: %move pkg/pkg.new.cj pkg/pkg.old.cj
// EXEC: %compiler %incrementalCompile pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%middle test.cj -o %output 2>&1 | compare %f
// ASSERT: scan no raw modified decls
// ASSERT: scan incremental compile result kind: no change
// EXEC-1: %run %run_opt %output %run_args

internal import pkg.*

const b = a

main() {
    b - foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
