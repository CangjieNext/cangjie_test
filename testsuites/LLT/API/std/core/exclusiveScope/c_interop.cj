/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.c
// EXEC: %compiler %f -o lib%n.%dylib_suffix %compile_shared_lib_opt
// (Linux) EXEC: %clang -lcangjie-runtime -l%n -lpthread -L. -L"$CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative" -o %n.%suffix %n.c
// (Linux) EXEC: %n.%suffix y >> a.t
// (Linux) EXEC: %n.%suffix n >> a.t
// (Linux) EXEC: %cat a.t | compare %f

import std.collection.ArrayList
import std.sync.AtomicBool

const THREADS = 20
const ITERATIONS = 20

@C
struct Result {
    var thread_id: UInt64 = 0
    var page_size: UInt64 = 0
    var stack_pointer: UInt64 = 0
    var stack_base: UInt64 = 0
    var stack_size: UInt64 = 0
    var guard_size: UInt64 = 0
}

type CheckType = CFunc<(result: CPointer<Result>) -> Unit>

var check_impl: CheckType = unsafe { zeroValue<CheckType>() }

func call_check(): Result {
    var result = Result()
    unsafe {
        check_impl(inout result)
    }
    if (result.page_size < 1024) {
        throw Exception("Incorrect page size")
    }
    if (result.stack_base < 1024 || result.stack_size < 1024) {
        throw Exception("Incorrect stack size")
    }
    return result
}

func check_print(threadExpected: ?UInt64): Bool {
    let result = call_check()
    if (let Some(id) <- threadExpected && result.thread_id != id) {
        return false
    }
    let stack_pointer = result.stack_pointer
    let stack_base = result.stack_base
    let stack_end = result.stack_base + result.stack_size
    return stack_base <= stack_pointer && stack_pointer < stack_end
}

let ok = AtomicBool(true)

func check(threadExpected: ?UInt64, osStackExpected!: Bool = true): Unit {
    if (check_print(threadExpected) != osStackExpected) {
        ok.store(false)
    }
}

@C
func cj_workload(withExclusiveScopeInt: Int32, check_arg: CheckType): Int32 {
    let withExclusiveScope = withExclusiveScopeInt != 0
    check_impl = check_arg

    let main_id = call_check().thread_id

    check(main_id)

    let list = ArrayList<Future<Unit>>()
    for (_ in 0..THREADS) {
        list.add(
            spawn {
                if (withExclusiveScope) {
                    exclusiveScope<Unit> {
                        let initial_id = call_check().thread_id
                        for (_ in 0..ITERATIONS) {
                            check(initial_id, osStackExpected: true)
                            sleep(Duration.millisecond)
                        }
                        let last_id = call_check().thread_id
                        if (initial_id != last_id) {
                            throw Exception("${initial_id} != ${last_id}")
                        }
                    }
                } else {
                    for (_ in 0..ITERATIONS) {
                        check(None, osStackExpected: false)
                        sleep(Duration.millisecond)
                    }
                }
            }
        )
    }

    check(main_id)

    // Wait for all threads to finish.
    for (f in list) {
        f.get()
    }

    check(main_id)

    if (ok.load()) { 1 } else { 0 }
}

// ASSERT: scan-2 OK
// ASSERT: scan-not FAIL
