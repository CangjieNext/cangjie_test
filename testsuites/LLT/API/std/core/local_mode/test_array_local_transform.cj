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
// 覆盖设计项（LM-DOC-20260910）：T109/T110/T111/T112/T113/T114/T115/T116/T117。
//
// RUNTIME-BLOCKED：map/filter/step(非空)/intersperse(长度>=2) 的结果数组通过
// `arraySet2` 向 local 对象写入，当前 runtime 触发
// `F Barrier::WriteGeneric does not support local object`（rc=134）；对应
// doc-correct 调用、值、顺序、计数和异常期望均保留为 SKIPPED 注释。flatMap/
// filterMap 的 local callback 返回值还受 SDK 的 local 构造表达能力阻塞。
// concat/take/skip/clone-backed paths 使用块复制或视图，forEach/fold 及空输入
// 分支可执行。T117 的 non-Copyable String 裸 R fold 是设计与当前 R@local! 实现
// 的 CONFLICT，保留静态探针注释。
// 设计编号命名空间：LM-DOC-20260910。

class TransformTrace {
    var count: Int64
    var trace: Int64

    init() {
        this.count = 0
        this.trace = 0
    }

    func record(value: Int64): Unit {
        this.count += 1
        this.trace = this.trace * 10 + value
    }
}

func transformNegative(): Int64 {
    -1
}

func transformFive(): Int64 {
    5
}

func transformMax(): Int64 {
    Int64.Max
}

main(): Int64 {
    var failed = 0

    // T109: concat's empty-left, empty-right, and general branches.
    let empty109: Array<Int64> @local! = Array<Int64>()
    let one109: Array<Int64> @local! = [3]
    let left109: Array<Int64> @local! = [1]
    let right109: Array<Int64> @local! = [1, 2]
    let tail109: Array<Int64> @local! = [3, 4]
    let emptyLeft109: Array<Int64> @local! = empty109.concat(one109)
    failed += assertEq(emptyLeft109.size, 1, "T109_concat_empty_left_size")
    failed += assertEq(emptyLeft109[0], 3, "T109_concat_empty_left_0")
    let emptyRight109: Array<Int64> @local! = left109.concat(empty109)
    failed += assertEq(emptyRight109.size, 1, "T109_concat_empty_right_size")
    failed += assertEq(emptyRight109[0], 1, "T109_concat_empty_right_0")
    let both109: Array<Int64> @local! = right109.concat(tail109)
    failed += assertEq(both109.size, 4, "T109_concat_general_size")
    failed += assertEq(both109[0], 1, "T109_concat_general_0")
    failed += assertEq(both109[1], 2, "T109_concat_general_1")
    failed += assertEq(both109[2], 3, "T109_concat_general_2")
    failed += assertEq(both109[3], 4, "T109_concat_general_3")
    // SKIPPED: T109 independence requires writes to the concat output; doc-correct
    // expectation is both `both109[0] = 9` and `emptyLeft109[0] = 8` leave every
    // source element in right109/tail109 unchanged.

    // T110: splitAt boundaries, empty input, values, and shared-view reads.
    let source110: Array<Int64> @local! = [0, 1, 2, 3]
    let (left110_0, right110_0): (Array<Int64>, Array<Int64>) @local! = source110.splitAt(0)
    failed += assertEq(left110_0.size, 0, "T110_split_mid0_left_size")
    failed += assertEq(right110_0.size, 4, "T110_split_mid0_right_size")
    failed += assertEq(right110_0[0], 0, "T110_split_mid0_right_0")
    let (left110_2, right110_2): (Array<Int64>, Array<Int64>) @local! = source110.splitAt(2)
    failed += assertEq(left110_2.size, 2, "T110_split_mid2_left_size")
    failed += assertEq(left110_2[0], 0, "T110_split_mid2_left_0")
    failed += assertEq(left110_2[1], 1, "T110_split_mid2_left_1")
    failed += assertEq(right110_2.size, 2, "T110_split_mid2_right_size")
    failed += assertEq(right110_2[0], 2, "T110_split_mid2_right_0")
    failed += assertEq(right110_2[1], 3, "T110_split_mid2_right_1")
    let (left110_4, right110_4): (Array<Int64>, Array<Int64>) @local! = source110.splitAt(4)
    failed += assertEq(left110_4.size, 4, "T110_split_mid4_left_size")
    failed += assertEq(right110_4.size, 0, "T110_split_mid4_right_size")
    failed += assertEq(left110_4[0], 0, "T110_split_mid4_left_0")
    failed += assertEq(left110_4[1], 1, "T110_split_mid4_left_1")
    failed += assertEq(left110_4[2], 2, "T110_split_mid4_left_2")
    failed += assertEq(left110_4[3], 3, "T110_split_mid4_left_3")
    let empty110: Array<Int64> @local! = Array<Int64>()
    let (emptyLeft110, emptyRight110): (Array<Int64>, Array<Int64>) @local! = empty110.splitAt(0)
    failed += assertEq(emptyLeft110.size, 0, "T110_split_empty_left_size")
    failed += assertEq(emptyRight110.size, 0, "T110_split_empty_right_size")
    try {
        let _ = source110.splitAt(transformNegative())
        failed += 1
        println("FAIL: T110_split_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        let _ = source110.splitAt(transformFive())
        failed += 1
        println("FAIL: T110_split_past_end — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    // SKIPPED: T110 writes through left110_2/right110_2 are blocked by the
    // local-object write barrier; doc-correct expectation is source view aliasing
    // (left[0]=9 writes source[0], right[0]=8 writes source[2]).

    // T111: repeat values, empty identity branch, invalid counts, and overflow.
    let repeatSource111: Array<Int64> @local! = [1, 2]
    let repeated111: Array<Int64> @local! = repeatSource111.repeat(2)
    failed += assertEq(repeated111.size, 4, "T111_repeat_size")
    failed += assertEq(repeated111[0], 1, "T111_repeat_0")
    failed += assertEq(repeated111[1], 2, "T111_repeat_1")
    failed += assertEq(repeated111[2], 1, "T111_repeat_2")
    failed += assertEq(repeated111[3], 2, "T111_repeat_3")
    let emptyRepeat111: Array<Int64> @local! = empty110.repeat(2)
    failed += assertEq(emptyRepeat111.size, 0, "T111_repeat_empty_size")
    try {
        let _ = repeatSource111.repeat(0)
        failed += 1
        println("FAIL: T111_repeat_zero — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        let _ = repeatSource111.repeat(transformNegative())
        failed += 1
        println("FAIL: T111_repeat_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        let _ = repeatSource111.repeat(transformMax())
        failed += 1
        println("FAIL: T111_repeat_overflow — expected OverflowException")
    } catch (e: OverflowException) {}
    // SKIPPED: T111 repeated111 write-independence assertion is doc-correct but
    // requires local-object mutation; the returned container must be independent.

    // T112: step boundary/error paths. Non-empty successful extraction writes each
    // selected element with arraySet2 and is therefore retained as a doc-correct skip.
    let emptyStep112: Array<Int64> @local! = empty110.step(2)
    failed += assertEq(emptyStep112.size, 0, "T112_step_empty_size")
    try {
        let _ = repeatSource111.step(0)
        failed += 1
        println("FAIL: T112_step_zero — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    try {
        let _ = repeatSource111.step(transformNegative())
        failed += 1
        println("FAIL: T112_step_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    // SKIPPED: T112 successful non-empty step values are doc-correct:
    // [0,1,2,3,4].step(2)=[0,2,4], step(6)=[0], step(Int64.Max)=[0].
    // The latter must not overflow merely while computing the result size.

    // T113: take/skip prefixes and suffixes, including all boundaries.
    let source113: Array<Int64> @local! = [0, 1, 2, 3]
    let take0_113: Array<Int64> @local! = source113.take(0)
    failed += assertEq(take0_113.size, 0, "T113_take_zero_size")
    let take2_113: Array<Int64> @local! = source113.take(2)
    failed += assertEq(take2_113.size, 2, "T113_take_two_size")
    failed += assertEq(take2_113[0], 0, "T113_take_two_0")
    failed += assertEq(take2_113[1], 1, "T113_take_two_1")
    let take9_113: Array<Int64> @local! = source113.take(9)
    failed += assertEq(take9_113.size, 4, "T113_take_long_size")
    failed += assertEq(take9_113[3], 3, "T113_take_long_3")
    try {
        let _ = source113.take(transformNegative())
        failed += 1
        println("FAIL: T113_take_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    let skip0_113: Array<Int64> @local! = source113.skip(0)
    failed += assertEq(skip0_113.size, 4, "T113_skip_zero_size")
    failed += assertEq(skip0_113[0], 0, "T113_skip_zero_0")
    let skip2_113: Array<Int64> @local! = source113.skip(2)
    failed += assertEq(skip2_113.size, 2, "T113_skip_two_size")
    failed += assertEq(skip2_113[0], 2, "T113_skip_two_0")
    failed += assertEq(skip2_113[1], 3, "T113_skip_two_1")
    let skip4_113: Array<Int64> @local! = source113.skip(4)
    failed += assertEq(skip4_113.size, 0, "T113_skip_equal_size")
    let skip9_113: Array<Int64> @local! = source113.skip(9)
    failed += assertEq(skip9_113.size, 0, "T113_skip_long_size")
    try {
        let _ = source113.skip(transformNegative())
        failed += 1
        println("FAIL: T113_skip_negative — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    // SPEC-CONFLICT: skip(0) ownership is unspecified by the closed loop; values and
    // mode above are asserted, but no write-through/deep-copy claim is made.

    // T114: empty map/filter branches make zero callback calls without local writes.
    let emptyMap114: Array<Int64> @local! = empty110.map({ _ =>
        throw IllegalArgumentException("sentinel")
    })
    failed += assertEq(emptyMap114.size, 0, "T114_map_empty_size")
    let emptyFilter114: Array<Int64> @local! = empty110.filter({ _ =>
        throw IllegalArgumentException("sentinel")
    })
    failed += assertEq(emptyFilter114.size, 0, "T114_filter_empty_size")
    // SKIPPED: T114 non-empty map [1,2,3,4]=>[2,4,6,8] and filter=>[2,4],
    // callback order/count=4, stable order, output local! and independence are
    // doc-correct but non-empty output writes hit Barrier::WriteGeneric.

    // T115: local callback return construction is blocked in the current SDK.
    // SKIPPED: T115 flatMap [1,2] x=>[x,x*10] expected [1,10,2,20], and
    // filterMap [1,2,3] odd=>Some(x*10) expected [10,30], both local! and stable.
    // The callback-at-sentinel propagation rows are retained as the same blocked
    // positive family; no concat/filter/map result is counted as indirect coverage.

    // T116: intersperse len<2 clone branches are read-safe; multi-element writes skip.
    let emptyInter116: Array<Int64> @local! = empty110.intersperse(0)
    failed += assertEq(emptyInter116.size, 0, "T116_intersperse_empty_size")
    let oneInter116: Array<Int64> @local! = one109.intersperse(0)
    failed += assertEq(oneInter116.size, 1, "T116_intersperse_one_size")
    failed += assertEq(oneInter116[0], 3, "T116_intersperse_one_0")
    // SKIPPED: T116 [1,2,3].intersperse(0) expected [1,0,2,0,3]; the len>=2
    // path writes via arraySet2 and is blocked by Barrier::WriteGeneric.

    // T117: forEach trace/order/count, empty zero calls, and exception propagation.
    let source117: Array<Int64> @local! = [1, 2, 3]
    let trace117 = TransformTrace()
    source117.forEach({ x => trace117.record(x) })
    failed += assertEq(trace117.count, 3, "T117_forEach_count")
    failed += assertEq(trace117.trace, 123, "T117_forEach_trace")
    let emptyTrace117 = TransformTrace()
    empty110.forEach({ x => emptyTrace117.record(x) })
    failed += assertEq(emptyTrace117.count, 0, "T117_forEach_empty_count")
    let folded117: Int64 @local! = source117.fold(10, { acc, x => acc * 10 + x })
    failed += assertEq(folded117, 10123, "T117_fold_value")
    let emptyFold117: Int64 @local! = empty110.fold(10, { acc, x => acc * 10 + x })
    failed += assertEq(emptyFold117, 10, "T117_fold_empty_value")
    let throwForEach117 = TransformTrace()
    try {
        source117.forEach({ x =>
            throwForEach117.record(x)
            if (x == 2) {
                throw IllegalArgumentException("sentinel")
            }
        })
        failed += 1
        println("FAIL: T117_forEach_throw — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    failed += assertEq(throwForEach117.count, 2, "T117_forEach_throw_count")
    failed += assertEq(throwForEach117.trace, 12, "T117_forEach_throw_trace")
    let throwFold117 = TransformTrace()
    try {
        let _ = source117.fold(10, { acc, x =>
            throwFold117.record(x)
            if (x == 2) {
                throw IllegalArgumentException("sentinel")
            }
            acc * 10 + x
        })
        failed += 1
        println("FAIL: T117_fold_throw — expected IllegalArgumentException")
    } catch (e: IllegalArgumentException) {}
    failed += assertEq(throwFold117.count, 2, "T117_fold_throw_count")
    failed += assertEq(throwFold117.trace, 12, "T117_fold_throw_trace")
    // CONFLICT: closed-loop T117 requires a non-Copyable String fold result bound to
    // bare String. Current Array.fold returns R@local!, so this exact static probe is
    // retained without silently changing it to String@local!:
    // let stringSource117: Array<String> @local! = ["a", "b"]
    // let stringInitial117: String @local! = ""
    // let stringResult117: String = stringSource117.fold(stringInitial117,
    //     { acc, x => acc + x })

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
