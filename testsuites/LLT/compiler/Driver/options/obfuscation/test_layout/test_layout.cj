// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt --disable-reflection -j1 %f --save-temps .
// (CJNATIVE and O2) EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
// (CJNATIVE and not O2) EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC: %cat %n.opt.ll | %grep myfuncf

//  EXEC: %compiler %cmp_opt -j1 --disable-reflection %f --save-temps . --fobf-layout
//  EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC-1: %cat %n.opt.ll | %grep myfuncf

var mystr = "MS1 C5CF B6ED1 97C0 5194"

private func myfuncf() {
    var x = 3899644854
    if (x != 1498647828) {
        println(x)
    } else {
        println(mystr)
    }
    return 0
}

main() {
    myfuncf()
}
