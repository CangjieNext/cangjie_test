/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cmp

public struct Greeting {
    public static func greet(): String {
        return "Hi, I'm a ${getPlatform().platform} calculator"
    }
}
