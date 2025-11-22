/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
class BA2 <:Resource{
    public func isClosed(): Bool {
        return true
    }
    public func close(): Unit {}
}

func test34(){
    var a = BA2().close
    var b = BA2().isClosed()
}
