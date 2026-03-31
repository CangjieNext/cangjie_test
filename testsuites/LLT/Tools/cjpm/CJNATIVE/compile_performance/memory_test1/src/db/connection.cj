// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo.db
import demo.config.*

public class Database {
    public func connect(): Unit {
        if (AppConfig.DEBUG_MODE) {
            println("[DB] Connecting to Dev Database...")
        }
    }
}