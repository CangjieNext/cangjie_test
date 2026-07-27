/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: aspect_side
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt aspect_side -o libaspect_side.so %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -L. -laspect_side --import-path=. -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: LD_LIBRARY_PATH=.:$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- cross aspect -----#\n#----- woven -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import aspect_side.*

public func woven(): Unit {
    println("#----- woven -----#")
}

main() {
    woven()
    0
}
