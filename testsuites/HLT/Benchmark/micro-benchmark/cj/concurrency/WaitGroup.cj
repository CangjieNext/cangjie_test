/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

class WaitGroup {
    let m: Monitor = Monitor()
    private var cnt: Int64

    public init(cnt: Int64) {
        this.cnt = cnt
    }

    public func add(n: Int64) {
        m.lock()
        cnt += n
        if (cnt == 0) {
            m.notifyAll()
        } else if (cnt < 0) {
            throw Exception("negative WaitGroup counter")
        }
        m.unlock()
    }

    public func done() {
        this.add(-1)
    }

    public func wait() {
        m.lock()
        while (cnt > 0) {
            m.wait()
        }
        m.unlock()
    }
}
