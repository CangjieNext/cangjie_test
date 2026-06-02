/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %stdx-library-path %link-eh %f -o %output
// RUN-ERRCHECK: %run_stdx %output %run_args
// ASSERT: scan UnhandledCommand: Unhandled command

import stdx.effect.Command

class Eff <: Command<Int64> {}

main() {
    var a = try {
        perform Eff()
    } handle (e: Command<Unit>) {
        resume with ()
    }
    return a
}
