// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: obf.cfg
//  EXEC: %compiler %cmp_opt %f --save-temps . --obf-config obf.cfg --fobf-const
//  EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC: %cat %n.opt.ll
//  EXEC: %cat %n.opt.ll | %grep 1498647828

var myconst = 239955993

main() {
    var x = 3899644854
    if (x != 1498647828) {
        println(myconst)
    }
    return 0;
}
