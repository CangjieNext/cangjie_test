// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows) EXEC: %compiler %cmp_opt %f --save-temps . --fobf-layout -o %output -j0
// (not Windows) EXEC: %run %output
// (not Windows) EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
// (not Windows) EXEC: %compiler %cmp_opt %f --save-temps . --fobf-layout --obf-seed 0 -o %n.0.out -j0
// (not Windows) EXEC: %run %n.0.out
// (not Windows) EXEC: %llvmDissembler %n.opt.bc -o %n.0.opt.ll
// (not Windows) EXEC: diff %n.opt.ll %n.0.opt.ll

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
