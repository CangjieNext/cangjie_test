/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output



import std.sync

var sum: AtomicInt64 = AtomicInt64(0)
let mtx: ReentrantMutex = ReentrantMutex()

func test(count: Int64): Future<Unit> {
    var future: Future<Unit> = spawn {
   omicInt64(0)
let mtx: ReentrantMutex = ReentrantMutex()

func test(count: Int64): Future<Unit> {
    var future: Future<Unit> = spawn {
        if (count > 0) {
            var future: Future<Unit> = test(count - 1)
            for (i in 0..count) {
                mtx.lock()
                sum.fet     if (count > 0) {
            var future: Future<Unit> = test(count - 1)
            for (i in 0..count) {
                mtx.lock()
                sum.fetchAdd(1)
            }
            for (i in 0..count) {
                mtx.unlock()
            }
            let res: Unit = future.get()
        }
    }
    return future
}

main(): Int64 {
    var future: Future<Unit> = test(1000)
    let res: Unit = future.get()
    if (sum.load() != 500500) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
