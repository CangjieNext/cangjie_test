/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) DEPENDENCE: mock_libfuzzer.c
// (CJNATIVE and Unix) EXEC: %clang -c -fPIC mock_libfuzzer.c -o mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %n.%suffix
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
    Fuzzer(callback2).startFuzz()
    if (hit2 == 0) {
        return -2
    }
    FuzzerBuilder(callback).setArgs(["-max_len=999"]).setTargetFunction(callback3).build().startFuzz()
    if (hit3 != 0) {
        return -3
    }
    return 0
}

public func callback(dp: FuzzDataProvider): Int32 {
    hit++
    return 0
}

public func callback2(dp: FuzzDataProvider): Int32 {
    dp.consumeBytes(6) // maybe throw exception
    hit2++
    return 0
}

public func callback3(dp: FuzzDataProvider): Int32 {
    dp.consumeBytes(99999) // always throw
    hit3++
    return 0
}
