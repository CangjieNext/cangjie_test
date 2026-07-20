// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime enum generic coverage pass

enum SimpleResult {
    | Ok(Int64)
    | Err(String)
}

enum Option<T> {
    | Some(T)
    | None
}

enum MultiPayload<A, B> {
    | First(A)
    | Second(B)
    | Both(A, B)
    | Neither
}

func testSimpleEnum(): Bool {
    let ok: SimpleResult = SimpleResult.Ok(42)
    let err: SimpleResult = SimpleResult.Err("failed")
    var sum: Int64 = 0
    match (ok) {
        case SimpleResult.Ok(v) => sum += v
        case SimpleResult.Err(_) => sum += 1
    }
    match (err) {
        case SimpleResult.Err(msg) => sum += Int64(msg.size)
        case SimpleResult.Ok(_) => sum += 1
    }
    sum == 48
}

func unwrapOptionInt(o: Option<Int64>): Int64 {
    match (o) {
        case Some(v) => v
        case None => -1
    }
}

func testGenericOption(): Bool {
    let some: Option<Int64> = Option<Int64>.Some(100)
    let none: Option<Int64> = Option<Int64>.None
    let val1 = unwrapOptionInt(some)
    let val2 = unwrapOptionInt(none)
    val1 == 100 && val2 == -1
}

func unwrapMultiFirstOrSecond<A, B>(mp: MultiPayload<A, B>): String {
    match (mp) {
        case First(_) => "first"
        case Second(_) => "second"
        case Both(_, _) => "both"
        case Neither => "neither"
    }
}

func testMultiPayload(): Bool {
    let first: MultiPayload<Int64, String> = MultiPayload<Int64, String>.First(10)
    let second: MultiPayload<Int64, String> = MultiPayload<Int64, String>.Second("hello")
    let both: MultiPayload<Int64, String> = MultiPayload<Int64, String>.Both(20, "world")
    let neither: MultiPayload<Int64, String> = MultiPayload<Int64, String>.Neither
    let r1 = unwrapMultiFirstOrSecond(first)
    let r2 = unwrapMultiFirstOrSecond(second)
    let r3 = unwrapMultiFirstOrSecond(both)
    let r4 = unwrapMultiFirstOrSecond(neither)
    r1 == "first" && r2 == "second" && r3 == "both" && r4 == "neither"
}

main(): Int64 {
    if (!testSimpleEnum()) {
        return 1
    }
    if (!testGenericOption()) {
        return 2
    }
    if (!testMultiPayload()) {
        return 3
    }
    println("runtime enum generic coverage pass")
    0
}
