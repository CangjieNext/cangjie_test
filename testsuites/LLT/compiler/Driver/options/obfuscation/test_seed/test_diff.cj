// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --save-temps . --fobf-layout --obf-seed 256 -o %n.256.out
//  EXEC: %run %n.256.out
//  EXEC: %llvmDissembler %n.opt.bc -o %n.256.opt.ll
//  EXEC: %compiler %cmp_opt %f --save-temps . --fobf-layout --obf-seed 65536 -o %n.65536.out
//  EXEC: %run %n.65536.out
//  EXEC: %llvmDissembler %n.opt.bc -o %n.65536.opt.ll
//  EXEC-1: diff %n.256.opt.ll %n.65536.opt.ll

var mystr = "MS1 C5CF B6ED1 97C0 5194"

main() {
    var x = 3899644854
    if (x != 1498647828) {
        println(x)
    } else {
        println(mystr)
    }
    return 0;
}
