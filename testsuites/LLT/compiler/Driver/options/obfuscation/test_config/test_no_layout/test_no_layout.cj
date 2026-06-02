// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: layout.cfg
//  EXEC: %compiler %cmp_opt %f --save-temps . --obf-config layout.cfg --fobf-layout
//  EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC: %cat %n.opt.ll | %grep "constStrWithDistinctName"

func f() {
    var constStrWithDistinctName = "x"
    if (constStrWithDistinctName == "1 91FD C419") {
        println(constStrWithDistinctName)
    }
}

main() {
    f()
    return 0
}
