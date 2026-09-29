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
// BLOCKED (compiler): T416 removeIf with a NON-COPYABLE element and an INLINE lambda.
//
//   l.removeIf({ v: Item @local! => !v.keep })
//
// compiles but SEGFAULTs when the predicate is invoked, inside
// ArrayList.removeIf(@local!) at the `predicate(itemLocal)` call
// (collection/array_list.cj:798):
//
//   E CJNative Handle signal: 11.
//   E Thread "..." catched unhandled SIGSEGV from managed frame.
//   E   #0 ... t416RemoveIfNonCopyable...$g
//   E   #1 ... ArrayList::removeIfHWLEF0bG_QLEEQlE  at std/collection/array_list.cj:798
//
// The SAME element type and the same list work correctly when the predicate is a
// named exclave function instead of an inline lambda:
//
//   exclave func isRemovable(v: Item @local!): Bool { !v.keep }
//   l.removeIf(isRemovable)          // runs, list ends up as expected
//
// and the inline-lambda form works for a Copyable element (Int64).  So the defect
// is specific to a @local! closure parameter whose type is non-Copyable.
//
// Restore EXEC and drop the named-predicate companion once the inline form runs;
// the named-predicate assertion is kept here only so the list-mutation contract
// stays covered while the closure path is broken.
import std.collection.*
import std.core.*

class Item {
    public var keep: Bool
    public init(keep: Bool) { this.keep = keep }
    public exclave init(this @local!, keep: Bool) { this.keep = keep }
}

exclave func isRemovable(v: Item @local!): Bool { !v.keep }

// Doc-correct inline-lambda form; currently SEGFAULTs.
func t416RemoveIfInlineLambda(l: ArrayList<Item> @local!): Int64 {
    exclave {
        l.removeIf({ v: Item @local! => !v.keep })
        if (l.size != 1) { return 1 }
        if (!l[0].keep) { return 1 }
        0
    }
}

// Companion: identical mutation through a named predicate, which works today.
func t416RemoveIfNamedPredicate(l: ArrayList<Item> @local!): Int64 {
    exclave {
        l.removeIf(isRemovable)
        if (l.size != 1) { return 1 }
        if (!l[0].keep) { return 1 }
        0
    }
}

main(): Int64 {
    var failed = 0
    let src: Array<Item> @local! = [Item(true) @local!, Item(false) @local!]

    let named: ArrayList<Item> @local! = ArrayList<Item>(src) @local!
    failed += assertEq(t416RemoveIfNamedPredicate(named), 0, "T416_removeif_named_predicate")

    let inline: ArrayList<Item> @local! = ArrayList<Item>(src) @local!
    failed += assertEq(t416RemoveIfInlineLambda(inline), 0, "T416_removeif_inline_lambda")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
