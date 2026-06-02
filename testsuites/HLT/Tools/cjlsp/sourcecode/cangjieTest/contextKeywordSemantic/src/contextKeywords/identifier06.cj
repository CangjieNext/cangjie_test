/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

func t6<open>(open: open) {}

func f6() {
    var a1 = t6<Int64>(1)
    var a2 = t6_1<Float64>(private: 1.0)
}

func t6_1<private>(private!: private) {}

func fa<T>(a:T) {
    
}
