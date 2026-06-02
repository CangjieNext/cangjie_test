// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-1: %run %run_opt %output %run_args

main() {
    match (Option<(Option<Option<(UInt8, UInt8)>>, (UInt8, Int8))>.None) {
        case Some(_) => 0
        case None => 1
    }
}
