/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public class Base {
    public func get(): Int32 {
        return 1
    }
}

// ASSERT: regex :3:.* super class 'Base' is not inheritable

// ASSERT: regex :4:.* overridden function 'get' should have 'open' modifier
