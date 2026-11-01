// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan parse_objc_mirror_cannot_be_common_specific
package cmp

@ObjCMirror
public specific open class A {
    init()
}
