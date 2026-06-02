/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package default

func fnc(): Int {
    return 42
}

let cnst = 42
var vr = 42

class C {
    static let cnst = 42
    static var vr = 42

    static func fnc(): Int {
        return 42
    }
}

main() {}
