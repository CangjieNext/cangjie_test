// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Same package as main.cj but without importing the macro package: the
// injected `import p` must NOT be visible here. See main.cj for the case
// setup.

package scope_test

func fb(): Int64 {
    return hello()
}
