/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package record_invoke_03

struct Data {
    public let width: Int32
    public let length: Int32
    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }
}
