/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE and Linux) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters --link-options="--whole-archive $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -no-whole-archive -lstdc++ -lpthread -lgcc_s"
// (CJNATIVE and Darwin) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -lc++
// 测试help功能
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %set_stdx_path %run_opt %n.%suffix -help=1
// 测试fuzz主流程，当前使用atexit返回值是77
// (CJNATIVE and Unix) EXEC-77: %set_stdx_path %run %set_stdx_path %run_opt %n.%suffix -seed=12345

import stdx.fuzz.*

main() {
    Fuzzer(ttt).startFuzz()
    return 0
}

public func ttt(data: Array<UInt8>): Int32 {
    // 这里使用最简单的情况，防止fuzz对CI过程造成影响
    if (data.size % 2 == 0) {
        throw Exception("Input size is odd")
    }
    return 0
}
