/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var r11 = "中国".toArray() // [-28, -72, -83, -27, -101, -67] E4 B8 AD E5 9B BD
    if (!convertUtf8(r11, "|228|184|173|229|155|189")) {
        return 1
    }
    return 0
}

func convertUtf8(arr: Array<UInt8>, res: String) {
    var exp: String = ""
    for (i in arr) {
        exp = exp + "|" + "${i}"
    }
    if (exp != res) {
        return false
    }
    return true
}
