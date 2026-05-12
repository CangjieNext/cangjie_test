/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DESC: cjc -O0, check in generated chir, unused function should not be eliminated.
// EXEC: %compiler %cmp_opt --save-temps . -O0 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: chir-dis default.chir
// EXEC: %cat default.chirtxt | compare %f
// ASSERT: scan myTestFunc2222

func myTestFunc1111() {
    var a = "HEllO"
    var b: UInt8 = 0
    for (i in a where Int64(i) == 72) {
        b += i
        if (Int64(b) == 72) {
            break
        }
    }
    return b
}

func myTestFunc2222(s: String) {
    var a = "HEllO"
    var b: UInt8 = 0
    for (i in a where Int64(i) == 72) {
        b += i
        if (Int64(b) == 72) {
            break
        }
    }
    return b
}

main() {
    if (Int64(myTestFunc1111()) == 72) {
        return 0
    } else {
        return 1
    }
    return 1
}
