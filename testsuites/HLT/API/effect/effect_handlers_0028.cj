/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %stdx-library-path %link-eh %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.effect.Command

class Eff <: Command<Int64> {}

main() {
    var a = try {
        try {
            perform Eff()
        } handle (e: Command<Unit>) {
            resume with ()
        }
    } handle (e: Eff) {
        resume with 0
    }
    return a
}
