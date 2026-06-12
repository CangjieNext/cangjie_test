/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE and Linux) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-trace-compares --link-options="--whole-archive $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -no-whole-archive -lstdc++ -lpthread -lgcc_s"
// (CJNATIVE and Darwin) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-trace-compares $(find $CANGJIE_HOME -name libclang_rt.fuzzer_no_main.a) -lc++
// 测试compare插桩对fuzz效率的改进，按照预期会数秒内crash，但运气不好也会导致卡死，不适合放在CI里，使用 enablefuzz 条件运行
// 当前使用atexit返回值是77
// (enablefuzz and CJNATIVE and Unix) EXEC-77: %set_stdx_path %run %set_stdx_path %run_opt %n.%suffix -seed=12345 -use_cmp=1

import stdx.fuzz.*

@FastNative
foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

main() {
    Fuzzer(ttt).startFuzz()
    return 0
}

@OverflowWrapping
public func ttt(data: Array<UInt8>): Int32 {
    if (data.size < 4) {
        return 0
    }

    let ret = Array<UInt32>(1, repeat: 0)
    unsafe {
        let src = acquireArrayRawData(data)
        let dst = acquireArrayRawData(ret)
        memcpy_s(CPointer<UInt8>(dst.pointer), UIntNative(4), src.pointer, UIntNative(4))
        releaseArrayRawData(src)
        releaseArrayRawData(dst)
    }

    // 测试能否快速变异到指定的 int32
    if (ret[0] == 0x12345678) {
        throw Exception("TRAP")
    }

    return 0
}
