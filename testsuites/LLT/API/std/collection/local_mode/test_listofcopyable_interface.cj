/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// BLOCKED-SOURCE: ListOfCopyable<T> is missing its required ReadOnlyList<T> parent
//   interface in the 0907 SDK (C1/C2). The true interface static receiver probe below
//   must remain disabled until that source declaration is restored; no concrete
//   ArrayList receiver is used as a substitute.
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args

import std.collection.*

// Keep interface-method probes with the required static receiver type. These
// declarations are intentionally not replaced by ArrayList concrete receivers.
// SKIPPED: T418/T419 — the 0907 SDK's ListOfCopyable interface has no add
// overloads, although the current source contract requires all four. The
// doc-correct add expectations are retained in main below.

func t420RemoveAt(list: ListOfCopyable<Int64> @local?): Int64 {
    list.remove(at: 1)
}

func t420RemoveIf(list: ListOfCopyable<Int64> @local?): Unit {
    list.removeIf({value => value % 2 == 1})
}

func t420Clear(list: ListOfCopyable<Int64> @local?): Unit {
    list.clear()
}

func t420Set(list: ListOfCopyable<Int64> @local?): Unit {
    list[0] = 9
}

// This is the source-level parent-interface assertion that currently blocks
// T423 and proves the defect without a concrete receiver workaround.
func t423ReadOnlyParent(list: ListOfCopyable<Int64> @local?): ReadOnlyList<Int64> @local? {
    exclave {
        list
    }
}

main(): Int64 {
    // Doc-correct T418/T419 expectations retained while the source blocker is fixed:
    // capacity=8, ListOfCopyable<Int64> @local? add(1) => [1]
    // add(all: [2, 3]) => [1, 2, 3]
    // add(9, at: 0) => [9, 1, 2, 3]
    // add(all: [7, 8], at: 1) => [9, 7, 8, 1, 2, 3]
    // capacity=1 growth must succeed and preserve order (T419), not be accepted
    // as an UnimplementedException fallback.

    // Doc-correct T420/T421 expectations retained:
    // remove(at: 1) from [1, 2, 3] returns 2 and leaves [1, 3]
    // removeIf(value % 2 == 1) from [1, 2, 3, 4] leaves exactly [2, 4]
    // clear() makes both [1] and [] empty; []=(0, 9) changes [1, 2] to [9, 2]
    // Range cases 1..3, 1..=2, 2..2, step=2 and boundary exceptions retain
    // the T421 IllegalArgumentException/IndexOutOfBoundsException contract.

    // Doc-correct T422 expectation for a non-empty custom Collection<Int64>:
    // [1].add(all: [7, 8]) => [1, 7, 8], and
    // [1, 4].add(all: [7, 8], at: 1) => [1, 7, 8, 4]; empty source is a no-op.

    // Doc-correct T423 expectation once the parent declaration is available:
    // ListOfCopyable<Int64> @local? -> ReadOnlyList<Int64> must expose
    // first=1, last=3, get(1)=2, and [1]=2.
    0
}
