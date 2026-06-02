// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --save-temps . --fobf-const
//  EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC-1: %cat %n.opt.ll | %grep 3899644854

main() {
    var x = 3899644854
    if (x != 1498647828) {
        println(x)
    }
    return 0;
}
