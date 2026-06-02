/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: stdin_readtoend.txt
// EXEC: %compiler %cmp_opt -o %output %f
// (not iOS) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args < stdin_readtoend.txt 2>&1 | compare %f
// ASSERT: scan 
// ASSERT: scan \\0
// ASSERT: scan 12232548359
// ASSERT: scan dhewpcipmqveqv
// ASSERT: scan #$$*&_+^_(*)(&^#$%##$)
// ASSERT: scan 仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉仓颉
// ASSERT: scan 齉龘齉齾爩麤龗灪龖厵纞虋
// ASSERT: scan ┱┲❣✚✪✣✤✥✦❉❥❦❧❃❂❁❀✄☪✱✲✳❃❂❁❀✿✾✽✼✻✺✹✸✷✶✵✴❄❅❆

import std.env.*

main() {
    let c = getStdIn().readToEnd()
    print(c.getOrThrow());
    return 0
}
