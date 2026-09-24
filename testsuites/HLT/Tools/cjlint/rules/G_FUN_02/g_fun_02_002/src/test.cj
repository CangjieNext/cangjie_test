/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Logger {
    func printLog(msg: String, level: Int64): Unit {
        println(msg)
    }
}

main() {
    let logger = Logger()
    logger.printLog("hello", 1)
}
