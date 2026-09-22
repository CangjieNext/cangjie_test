/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class SecurityCheck {
    public func checkPasswordAuthentication(protocol: String, prompt: String, scheme: String): Bool {
        return protocol.size > 0 && prompt.size > 0 && scheme.size > 0
    }
}

main() {
    let sc = SecurityCheck()
    println(sc.checkPasswordAuthentication("p", "pr", "sch"))
}
