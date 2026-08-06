// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Imported sealed hierarchies stay conservative inside tuple columns and enum payloads.
// DEPENDENCE: ./pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: regex-not warning

internal import pkg.*

enum Box {
    | Empty
    | Wrap(Result)
}

func importedTuple(value: (Result, Bool)) {
    match (value) {
        case (_: Success, true) => 0
        case (_: Success, false) => 1
        case _ => 2
    }
}

func importedPayload(value: Box) {
    match (value) {
        case Empty => 0
        case Wrap(_: Success) => 1
        case Wrap(_) => 2
    }
}

main() {
    importedTuple((Success(), true))
    importedPayload(Wrap(Success()))
    println(classify(Success()))
}
