// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (DEBUG_OPTION) EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt %f 2>&1 | compare %f
//  ASSERT: scan pkg_c_wrapper

package pkg

@C
private func foo() {}

@Frozen
public func goo<T>() {
    unsafe { foo() }
}
