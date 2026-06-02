/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum EE1 {
    XY
}

extend EE1 {
    func name() {
        return 2
    }
}

main() {
    var aa = (EE1.XY, EE1.XY.name())
    var bb = EE1.XY
    return 0
}
