// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    println("hello world")
    for (i in 1..=1000000000000000000) {
        var in641: Int64 = 11
    }
    return 0
}

// (Linux and CJNATIVE) EXEC: %compiler %f -o %output --save-temps . -j1
// (Linux and CJNATIVE) EXEC: %llvmDissembler %n.opt.bc

// grep all debug location of <main>
// (Linux and CJNATIVE) EXEC: sed -nE '/define i64 @"_CN7default6<main>Hv"/,/^(declare|define) /p' %n.opt.ll | sed '1d;$d' | perl -lne 'print $1 if /!(\d+)/' | sort -n | uniq | sed -n '1p;$p' > b.t
// check if no line has line:0, column:0
// (Linux and CJNATIVE) EXEC-1: sed -nE '/^!'"$(sed 2d b.t)"' = /,/^!'"$(sed 1d b.t)"' = /p' %n.opt.ll | grep 'line: 0, column: 0'
