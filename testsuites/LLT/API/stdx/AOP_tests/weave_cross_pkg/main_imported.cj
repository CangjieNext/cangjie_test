/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Cross-package weave when aspect_pkg is already imported: callUpstreamPkgInitFunc
// reuses the existing init declaration but still createApply. ready=7 confirms
// upstream init (via import and/or the inserted apply) has run.

// DEPENDENCE: state_pkg aspect_pkg
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt state_pkg -o libstate_pkg.%dylib_suffix
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt aspect_pkg -o libaspect_pkg.%dylib_suffix -L. --import-path=. -lstate_pkg %collect_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -L. -laspect_pkg -lstate_pkg --import-path=. -o %output %weave_aspects_plugin
// EXEC-PIPE-0: LD_LIBRARY_PATH=.:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH %run %run_opt %output %run_args | compare %f
// ASSERT: scan ready=7\n#----- cross aspect -----#\n#----- woven -----#\n
// ASSERT: scan-not ready=0
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import aspect_pkg.*

public func woven(): Unit {
    println("#----- woven -----#")
}

main() {
    woven()
    0
}
