// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test1.cj 清洗版回归用例（issue 1089）：finalizer 对象的字段读若被 LICM
// 提升出循环，GC 活性分析会误判对象已死，GC 中途回收对象并执行 ~init()
// 置空 m.s，后续 s.getOrThrow() 抛 NoneValueException。
// 注意不能使用显式 gc() 驱动：gc() 是完整内存屏障会阻止 LICM 提升字段读，
// 用例将无法抓住回归。这里用每轮字符串插值 "${i}" 的分配驱动 GC，分配不会
// 阻止提升；checksum 累计防止循环被整体优化掉。
//
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class M {
    var s: ?String = "x"

    func g(): Int64 {
        // 若 T 被提前 finalize，s 变 None，这里抛 NoneValueException。
        s.getOrThrow()
        return 1
    }
}

public class T {
    var m = M()

    ~init() {
        m.s = None
    }

    public func f(): Int64 {
        return m.g()
    }
}

main(): Int64 {
    let t = T()
    var checksum: Int64 = 0
    for (i in 0..1000000) {
        checksum += t.f()
        checksum += "${i}".size
    }
    println("finalizer object liveness ok ${checksum}")
    return 0
}
