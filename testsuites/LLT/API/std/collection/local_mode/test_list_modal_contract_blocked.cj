/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ../../core/local_mode/local_mode_utils.cj
// DISABLED-EXEC: %compiler %cmp_opt ../../core/local_mode/local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED（设计项 LM-DOC-20260910：T413/T414/T416/T417）：
// ReadOnlyList 的 modal 读契约（get/[] 的 @local!/@local? 声明）与 List 的
// local! 9 方法接口声明在当前源码/SDK 均缺失（BLOCKED-API-GAP/BLOCKED-SOURCE，
// 见设计行 1078-1083/1114-1117）。以下保留 doc-correct 探针；不得用具体
// ArrayList 调用冒充接口入口。T417 的 heap 实参负例依赖 T416 先可编译。
import std.collection.*
import std.core.*

main(): Int64 {
    var failed = 0

    // T413: ReadOnlyList<String> @local! 静态接收者
    let al: ArrayList<String> @local! = ArrayList<String>(["a", "b"]) @local!
    let rlL: ReadOnlyList<String> @local! = al
    let gL: ?String @local! = rlL.get(0)
    failed += assertB(gL.getOrThrow() == "a", "T413_get0_local_bang")
    let iL: String @local! = rlL[0]
    failed += assertB(iL == "a", "T413_index0_local_bang")

    // T414: 同一接收者上转 @local?
    let rlQ: ReadOnlyList<String> @local? = al
    let gQ: ?String @local? = rlQ.get(0)
    failed += assertB(gQ.getOrThrow() == "a", "T414_get0_local_q")

    // T416: List<String> @local! 静态接收者 9 方法（各自独立初态）
    let l1: List<String> @local! = ArrayList<String>(["b", "d"]) @local!
    l1.add("e")
    l1.add(all: ["f", "g"])
    l1.add("a", at: 0)
    l1.add(all: ["c", "e"], at: 1)
    let removed: String @local! = l1.remove(at: 0)
    l1.remove(0..1)
    l1.removeIf({ v: String @local! => v == "b" })
    l1.clear()
    l1[1] = "z"

    // T417: 独立负例——heap String 传 List<String>@local!.add（依赖 T416 编译，
    // 当前被缺失声明遮蔽；预期唯一诊断为 heap→full 参数 mode 不匹配）
    let heapArg: String = "heap"

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
