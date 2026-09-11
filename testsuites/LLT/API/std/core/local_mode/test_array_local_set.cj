/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED（设计项 LM-DOC-20260910：T121/T122/T123/T124/T125）：所有正向
// local! 写入族均会在当前 runtime 进入 `Barrier::WriteGeneric does not support
// local object` 并以 SIGABRT rc=134 终止（String 引用、Int64/generic payload
// 都可复现）。因此本文件只保留 doc-correct 的精确值、异常、失败原子性与
// overlap/memmove 断言；SDK/runtime 实现 local-object 写屏障后恢复 EXEC。
// 这些是规范正向测试，不是语言负例；不能把当前 abort 改成成功 oracle。
// 设计编号命名空间：LM-DOC-20260910。

func setNegative(): Int64 {
    -1
}

func setFour(): Int64 {
    4
}


main(): Int64 {
    var failed = 0

    // T121: arbitrary non-Copyable element type is accepted by local! []=.
    // This first valid write intentionally demonstrates the current blocker.
    let text121: Array<String> @local! = ["before", "keep"]
    let replacement121: String @local! = "after"
    text121[0] = replacement121
    failed += assertB(text121[0] == "after", "T121_string_index_set_value")
    // Doc-correct Int64 variant (same local! overload):
    let ints121: Array<Int64> @local! = [1, 2]
    ints121[1] = 9
    failed += assertEq(ints121[1], 9, "T121_int64_index_set_value")
    try {
        let _ = text121[setNegative()]
        failed += 1
        println("FAIL: T121_index_negative — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        text121[setFour()] = replacement121
        failed += 1
        println("FAIL: T121_index_past_end — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}

    // T122: range-set legality checks precede the write. The target must remain
    // unchanged for every rejected range; valid overlap is snapshot/memmove.
    // The 0907 compiler's local range-set lowering is itself a broken LLVM
    // intrinsic when exception paths are present, so the exact probes stay in
    // comments in this disabled runtime-blocked case.
    // let range122: Array<Int64> @local! = [0, 1, 2, 3]
    // let value122: Array<Int64> @local! = [7, 8]
    // let stepTwo122 = Range<Int64>(0, 4, 2, true, false, false)
    // try {
    //     range122[stepTwo122] = value122
    //     failed += 1
    //     println("FAIL: T122_range_step — expected IllegalArgumentException")
    // } catch (e: IllegalArgumentException) {}
    // try {
    //     let badOrder122 = Range<Int64>(3, 2, 1, true, false, false)
    //     range122[badOrder122] = [7]
    //     failed += 1
    //     println("FAIL: T122_range_order — expected IndexOutOfBoundsException")
    // } catch (e: IndexOutOfBoundsException) {}
    // try {
    //     let badEnd122 = Range<Int64>(1, 5, 1, true, false, false)
    //     range122[badEnd122] = [7, 8, 9, 10]
    //     failed += 1
    //     println("FAIL: T122_range_end — expected IndexOutOfBoundsException")
    // } catch (e: IndexOutOfBoundsException) {}
    // try {
    //     range122[1..3] = [7]
    //     failed += 1
    //     println("FAIL: T122_range_size — expected IllegalArgumentException")
    // } catch (e: IllegalArgumentException) {}
    // T122/T125 exact overlap expectations after the write barrier is fixed:
    // let rightShift122: Array<Int64> @local! = [0, 1, 2, 3, 4]
    // rightShift122[1..4] = rightShift122[0..3]
    // expected [0, 0, 1, 2, 4], not sequential-write pollution [0,0,0,0,4].
    // let leftShift122: Array<Int64> @local! = [0, 1, 2, 3, 4]
    // leftShift122[0..3] = leftShift122[1..4]
    // expected [1, 2, 3, 3, 4].

    // T123: fill, swap, and reverse boundary/error matrix.
    let empty123: Array<Int64> @local! = []
    empty123.fill(9)
    failed += assertEq(empty123.size, 0, "T123_fill_empty_size")
    let filled123: Array<Int64> @local! = [1, 2, 3]
    filled123.fill(9)
    failed += assertEq(filled123[0], 9, "T123_fill_0")
    failed += assertEq(filled123[1], 9, "T123_fill_1")
    failed += assertEq(filled123[2], 9, "T123_fill_2")
    let swap123: Array<Int64> @local! = [0, 1, 2]
    try {
        swap123.swap(setNegative(), 0)
        failed += 1
        println("FAIL: T123_swap_first_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        swap123.swap(0, setFour())
        failed += 1
        println("FAIL: T123_swap_second_past_end — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    swap123.swap(1, 1)
    failed += assertEq(swap123[1], 1, "T123_swap_same_index_unchanged")
    swap123.swap(0, 2)
    failed += assertEq(swap123[0], 2, "T123_swap_distinct_0")
    failed += assertEq(swap123[2], 0, "T123_swap_distinct_2")
    let reverseEmpty123: Array<Int64> @local! = []
    reverseEmpty123.reverse()
    failed += assertEq(reverseEmpty123.size, 0, "T123_reverse_empty_size")
    let reverseOne123: Array<Int64> @local! = [7]
    reverseOne123.reverse()
    failed += assertEq(reverseOne123[0], 7, "T123_reverse_one_value")
    let reverseEven123: Array<Int64> @local! = [0, 1, 2, 3]
    reverseEven123.reverse()
    failed += assertEq(reverseEven123[0], 3, "T123_reverse_even_0")
    failed += assertEq(reverseEven123[3], 0, "T123_reverse_even_3")
    let reverseOdd123: Array<Int64> @local! = [0, 1, 2, 3, 4]
    reverseOdd123.reverse()
    failed += assertEq(reverseOdd123[0], 4, "T123_reverse_odd_0")
    failed += assertEq(reverseOdd123[2], 2, "T123_reverse_odd_middle")
    failed += assertEq(reverseOdd123[4], 0, "T123_reverse_odd_4")

    // T124: offset copyTo normal, zero length, MC/DC errors and destination atomicity.
    let source124: Array<Int64> @local! = [1, 2, 3, 4]
    let destination124: Array<Int64> @local! = [0, 0, 0, 0]
    source124.copyTo(destination124, 1, 1, 2)
    failed += assertEq(destination124[0], 0, "T124_offset_uncovered_0")
    failed += assertEq(destination124[1], 2, "T124_offset_target_1")
    failed += assertEq(destination124[2], 3, "T124_offset_target_2")
    failed += assertEq(destination124[3], 0, "T124_offset_uncovered_3")
    let zeroDestination124: Array<Int64> @local! = [5, 6, 7, 8]
    source124.copyTo(zeroDestination124, 0, 0, 0)
    failed += assertEq(zeroDestination124[0], 5, "T124_zero_length_noop_0")
    failed += assertEq(zeroDestination124[3], 8, "T124_zero_length_noop_3")
    try {
        source124.copyTo(zeroDestination124, 0, 0, setNegative())
        failed += 1
        println("FAIL: T124_negative_length — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        source124.copyTo(zeroDestination124, setNegative(), 0, 1)
        failed += 1
        println("FAIL: T124_negative_src — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        source124.copyTo(zeroDestination124, 0, setNegative(), 1)
        failed += 1
        println("FAIL: T124_negative_dst — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        source124.copyTo(zeroDestination124, setFour(), 0, 1)
        failed += 1
        println("FAIL: T124_src_at_size — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        source124.copyTo(zeroDestination124, 0, setFour(), 1)
        failed += 1
        println("FAIL: T124_dst_at_size — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        source124.copyTo(zeroDestination124, 3, 0, 2)
        failed += 1
        println("FAIL: T124_src_remaining — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    try {
        source124.copyTo(zeroDestination124, 0, 3, 2)
        failed += 1
        println("FAIL: T124_dst_remaining — expected IndexOutOfBoundsException")
    } catch (e: IndexOutOfBoundsException) {}
    let shortDestination124: Array<Int64> @local! = [9, 9]
    try {
        source124.copyTo(shortDestination124)
        failed += 1
        println("FAIL: T124_full_copy_short_dst — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}

    // T125: full and offset same-rawptr overlap, plus arbitrary String elements.
    // Doc-correct exact results after barrier recovery:
    // let sameRawRight125: Array<Int64> @local! = [0, 1, 2, 3, 4]
    // sameRawRight125.copyTo(sameRawRight125, 0, 1, 4)
    // expected [0, 0, 1, 2, 3].
    // let sameRawLeft125: Array<Int64> @local! = [0, 1, 2, 3, 4]
    // sameRawLeft125.copyTo(sameRawLeft125, 1, 0, 4)
    // expected [1, 2, 3, 4, 4].
    // let sourceSlice125: Array<String> @local! = ["a", "b", "c", "d"]
    // let destinationSlice125: Array<String> @local! = sourceSlice125.slice(1, 3)
    // let sourceView125: Array<String> @local! = sourceSlice125.slice(0, 3)
    // sourceView125.copyTo(destinationSlice125, 0, 1, 2)
    // expected sourceSlice125 values ["a", "a", "b", "d"].

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
