/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and Linux) EXEC: %compiler %import-stdx-fuzz  %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-pc-table --link-options="--whole-archive $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -no-whole-archive -lstdc++ -lpthread -lgcc_s"
// (CJNATIVE and Darwin) EXEC: %compiler %import-stdx-fuzz  %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-pc-table $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -lc++
// 测试print-coverage功能
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %set_stdx_path %run_opt %n.%suffix -runs=100 -print_coverage=1 2>&1 | compare %f
// ASSERT: scan COVERAGE:
// ASSERT: regex COVERED_FUNC: hits: \d+ edges: \d+/\d+ ttt .+\/fuzzer_coverage.cj:\d+
// ASSERT: regex UNCOVERED_FUNC: hits: 0 edges: 0/\d+ main .+\/fuzzer_coverage.cj:\d+

import stdx.fuzz.*

main() {
    Fuzzer(ttt).startFuzz()
    return 0
}

public func ttt(data: Array<UInt8>): Int32 {
    if (data.size == 8 && data[0] == b'C' && data[1] == b'a' && data[2] == b'n' &&
        data[3] == b'g' && data[4] == b'j' && data[5] == b'i' && data[6] ==
        b'e' && data[7] == b'!') {
        println("Cangjie! Reached!")
    }
    return 0
}
