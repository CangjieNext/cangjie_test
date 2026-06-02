/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var str1: Array<IntNative> = []
    var str2: Array<UIntNative> = Array<UIntNative>()
    var r1: HashSet<Int8> = HashSet<Int8>()
    var r2: HashSet<Int16> = HashSet<Int16>()
    var r3: HashSet<IntNative> = HashSet<IntNative>()
    var r4: HashSet<UIntNative> = HashSet<UIntNative>([])
    var r5: HashSet<UIntNative> = HashSet<UIntNative>(0, {x: Int64 => UIntNative(x)})
    if (r1.size != 0) {
        return 1
    }
    if (r2.size != 0) {
        return 2
    }
    if (r3.size != 0) {
        return 3
    }
    if (r4.size != 0) {
        return 4
    }
    if (r5.size != 0) {
        return 5
    }
    print("success1\n")
    return 0
}
