// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// pw deliberately declares the SAME symbol name as pl: if the @When[os == "Windows"]
// item is wrongly kept (cond-comp evaluation degenerating to "keep all"), both
// `import pl` and `import pw` get injected and the use of lval() in call.cj hits
// "ambiguous match", which turns the case red. With correct evaluation pw is
// skipped on linux and only pl.lval is visible, so call.cj runs and prints 1.

package pw

public func lval(): Int64 {
    return 2
}
