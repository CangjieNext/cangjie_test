/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var arrayList: ArrayList<UInt64> = ArrayList<UInt64>([12, 26, 69, 64])
    let arrViaArrayListF: Array<ArrayList<UInt64>> = Array<ArrayList<UInt64>>(2, repeat: arrayList)
    let arrViaArrayListS: Array<ArrayList<UInt64>> = arrViaArrayListF.clone()
    if (arrViaArrayListF != arrViaArrayListS) {
        return 1
    }
    return 0
}
