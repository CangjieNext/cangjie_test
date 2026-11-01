/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Weave-only: className does not match the target's outer type and recursive is
// false, so meets rejects via the outerTypeNameMeets branch.

// EXEC-PIPE-0: printf '%s\n' 'default' 'dummyInit' 'InsertAtEntry' 'default' 'dummyAspect' '0' 'false' 'false' 'default' 'NoSuchClass' 'foo' '()->Unit' 'false' 'false' > default-default.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- foo -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public class CA {
    public func foo(): Unit {
        println("#----- foo -----#")
    }
}

main() {
    CA().foo()
    0
}
