/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) DEPENDENCE: mock_libfuzzer.c
// (CJNATIVE and Unix) EXEC: %clang -c -fPIC mock_libfuzzer.c -o mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %compiler %import-stdx-fuzz   %cmp_opt -o %n.%suffix %f mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %set_stdx_path %set_stdx_path %run %n.%suffix
import stdx.fuzz.*

var hit = 0
var hit2 = 0
var hit3 = 0

main() {
    Fuzzer(callback).startFuzz()
    Fuzzer(callback, ["-seed=12345"]).startFuzz()
    if (hit == 0) {
        return -1
    }
    let f = Fuzzer(callback)
    f.setArgs("-seed=12345")
    if (f.getArgs() != ["-seed=12345"]) {
        return -2
    }
    f.setTargetFunction(callback2)
    f.startFuzz()

    if (hit2 == 0) {
        return -3
    }
    FuzzerBuilder(callback).setArgs(["-seed=12345"]).setTargetFunction(callback3).build().startFuzz()
    if (hit3 == 0) {
        return -4
    }

    return 0
}

func callback(data: Array<UInt8>): Int32 {
    hit++
    return 0
}

func callback2(data: Array<UInt8>): Int32 {
    hit2++
    return 0
}

func callback3(data: Array<UInt8>): Int32 {
    hit3++
    return 0
}
