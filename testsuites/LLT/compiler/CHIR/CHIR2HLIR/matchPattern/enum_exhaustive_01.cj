// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %output
// (CJNATIVE) EXEC: %run %run_opt %output %run_args

main() {
    let x = match (Some(true)) {
        case Some(true) | Some(false) | Some(true) => 0
        case None => 1
    }
    x
}
