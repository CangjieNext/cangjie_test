/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// EXEC: %run %run_opt %output %run_args
//
// 覆盖设计项（LM-DOC-20260910）：T204（region-backed q 两向拷贝）、T205
// （producer region 内创建源、退出后消费 heap 拷贝）、T207（toString 跨 callee
// 帧返回 String @local!）。T206 四个直接赋值编译负例见
// test_string_local_neg_assign_*.cj；T208 隔离场景见
// test_string_local_tostring_no_region.cj（活跃）。
// 设计编号命名空间：LM-DOC-20260910。

// T205: producer region 内创建 local 源并返回文档允许的 heap 拷贝
exclave func produceHeapCopy(): String {
    let source: String @local! = "L仓\u{1F600}"
    let q: String @local? = source
    return String(q)
}

// T207: toString(this @local?) 在 callee 帧内分配并返回 String @local!
exclave func produceLocalToString(q: String @local?): String @local! {
    return q.toString()
}

main(): Int64 {
    var failed = 0

    // T204: region-backed String @local? → local! 拷贝构造（值与 bytes 精确）
    let src204: String @local! = "region-value"
    let q204: String @local? = src204
    let out204: String @local! = String(q204)
    failed += assertB(out204 == "region-value", "T204_regionQ_toLocal_value")
    failed += assertEq(out204.size, 12, "T204_regionQ_toLocal_size")
    // region-backed q → heap 拷贝构造
    let out204b: String = String(q204)
    failed += assertB(out204b == "region-value", "T204_regionQ_toHeap_value")

    // T205: producer 退出后消费 heap 拷贝（源在 producer 帧内创建并随之结束）
    let heapCopy205: String = produceHeapCopy()
    failed += assertB(heapCopy205 == "L仓\u{1F600}", "T205_afterExit_value")
    failed += assertEq(heapCopy205.size, 8, "T205_afterExit_size")
    let raw205: Array<Byte> = heapCopy205.toArray()
    failed += assertEq(raw205.size, 8, "T205_afterExit_bytes_size")
    failed += assertEq(raw205[0], 0x4Cu8, "T205_bytes_0")
    failed += assertEq(raw205[1], 0xE4u8, "T205_bytes_1")
    failed += assertEq(raw205[3], 0x93u8, "T205_bytes_3")
    failed += assertEq(raw205[4], 0xF0u8, "T205_bytes_4")
    failed += assertEq(raw205[7], 0x80u8, "T205_bytes_7")
    // 新建独立 region 后再次读取同一 heap 结果
    let again205: String @local! = String("again")
    failed += assertB(heapCopy205 == "L仓\u{1F600}", "T205_newRegion_value")
    failed += assertEq(again205.size, 5, "T205_newRegion_local_ok")

    // T207: toString 返回 String @local!，callee 退出后 caller 可读取值与 bytes
    let heap207: String = "仓颉Jie"
    let q207: String @local? = heap207
    let out207: String @local! = produceLocalToString(q207)
    failed += assertB(out207 == "仓颉Jie", "T207_toString_value")
    failed += assertEq(out207.size, 9, "T207_toString_size")
    let raw207: Array<Byte> @local! = out207.toArray()
    failed += assertEq(raw207[0], 0xE4u8, "T207_bytes_0")
    failed += assertEq(raw207[6], 0x4Au8, "T207_bytes_6")
    // T207: region-backed q 的 toString 同合同
    let local207: String @local! = "ab¢"
    let q207b: String @local? = local207
    let out207b: String @local! = produceLocalToString(q207b)
    failed += assertB(out207b == "ab¢", "T207_toString_regionQ_value")
    failed += assertEq(out207b.size, 4, "T207_toString_regionQ_size")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
