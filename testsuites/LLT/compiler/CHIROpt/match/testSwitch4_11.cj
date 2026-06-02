// (CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan line:13 and the column:12 was optimized by The opt: switchOpt

let g : h = i()
interface h {}
class i <: h  {}
enum s<n> {
    t | u
}

main() {
    match (match (s<Int16>.u) {
        case t =>
            ( g,true)
        case _ =>
            ( i(), true)
    }) {
        case (_ ,ai) =>
            5
        }
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
