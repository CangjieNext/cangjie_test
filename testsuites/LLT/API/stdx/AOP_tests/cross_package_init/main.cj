/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Guards callUpstreamPkgInitFunc createApply: without it, state_side.ready stays 0.

// DEPENDENCE: state_side aspect_side
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt state_side -o libstate_side.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt aspect_side -o libaspect_side.%dylib_suffix -L. --import-path=. -lstate_side %collect_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -L. -laspect_side -lstate_side --import-path=. -o %output %weave_aspects_plugin
// EXEC-PIPE-0: LD_LIBRARY_PATH=.:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH %run %run_opt %output %run_args | compare %f
// ASSERT: scan ready=7\n#----- cross aspect -----#\n#----- woven -----#\n
// ASSERT: scan-not ready=0
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func woven(): Unit {
    println("#----- woven -----#")
}

main() {
    woven()
    0
}
