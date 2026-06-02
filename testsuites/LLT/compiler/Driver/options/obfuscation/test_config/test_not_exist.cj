// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --save-temps . --fobf-const --obf-config obf.whatever -o %output 2>&1 | compare %f

main() {
    var valone = 3899644854
    if (valone != 1498647828) {
        println(condone)
    } else {
        println("2 00E3 56A7")
    }
    return 0;
}

/* SCAN
[31merror[0m: No such file or directory: 'obf.whatever'.
Invalid options. Try: 'cjc --help' for more information.
*/
