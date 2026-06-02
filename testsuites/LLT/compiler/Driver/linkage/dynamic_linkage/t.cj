// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: types
//  EXEC:%compiler  %import-cangjie-stdx --output-type=dylib ./types/*.cj -o libtypes.%dylib_suffix
//  EXEC:%compiler %import-cangjie-stdx  -ltypes -L./ ./t.cj -o %output
//  EXEC: %pwd_to_ld_path %set_stdx_path %output

internal import types.*

main() {
    let n3 = TreeNode(3)
    let n2 = TreeNode(2)
    n2.left = n3
    let n1 = TreeNode(1)
    n1.right = n2
    let x1 = TreeNode(4)
    let x2 = TreeNode(5)
    x2.right = n1
}
