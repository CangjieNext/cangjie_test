// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --save-temps . --fobf-cf-flatten
//  EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
//  EXEC-PIPE: %cat %n.opt.ll | compare %f
//  ASSERT: regex switch i32 %.*, label %obfuscatorFlt

main() {
    var condone = 3899644854
    if (condone != 1498647828) {
        var condtwo = 9289488820
        if (condtwo != 4118335582) {
            var condthree = 8162124549
            if (condthree != 5048779513) {
                println(1454630443)
            }
        }
    } else {
        println("2 00E3 56A7")
    }
    return 0;
}
