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
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %n.%suffix 2>&1 | compare %f
// (CJNATIVE and Unix) ASSERT: scan OutOfMemoryError throws during fuzz.
import stdx.fuzz.*
import std.math.*

main() {
    Fuzzer(ttt).startFuzz()
    return 0
}

public func ttt(data: Array<UInt8>): Int32 {
    let a = Array<Byte>(Int64.Max, repeat: 0)
    return 0
}
