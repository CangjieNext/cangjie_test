/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unicodeProject.cases
class Test_020 {
    private var Jack = 0
    public mut prop `_@`: Int64 {
        get() {
            Jack
        }
        set(v) {
            Jack = v
        }
    }
}
