// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgcj

common open class WithField {
    common init()
    common let x: Int32
    common static let y: Int32
}

func commonSay(f: WithField) {
    println("say from common: ${f.x} + ${WithField.y}")
}
