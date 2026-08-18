// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT whitebox#22 MergeIntoFuncs/RemoveImplementedSupers dedup.
// When multiple parent interfaces/extends provide same-named default implementations,
// MergeIntoFuncs deduplicates the candidate set, and RemoveImplementedSupers removes the
// implemented parent versions from the candidate set once the subclass implementation is hit,
// ensuring dispatch hits exactly one implementation with no duplicate calls.
// This case: two parent interfaces both default-implement `who`, and the subclass explicitly
// overrides it, asserting only the subclass implementation is called once (single "child impl").
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-1 child impl
// ASSERT: scan-not parentA default
// ASSERT: scan-not parentB default

interface PA {
    func who() {
        println("parentA default")
    }
}

interface PB {
    func who() {
        println("parentB default")
    }
}

// Subclass override: RemoveImplementedSupers removes the PA/PB defaults from the candidate
// set, and MergeIntoFuncs guarantees no duplicates.
class C <: PA & PB {
    public func who() {
        println("child impl")
    }
}

func dispatch<T>(x: T) where T <: PA & PB {
    x.who()
}

main() {
    dispatch(C())
    0
}
