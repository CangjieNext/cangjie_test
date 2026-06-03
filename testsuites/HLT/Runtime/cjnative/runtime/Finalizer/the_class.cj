/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

public class C {
    public static var callBack: () -> Unit = {=> println("do nothing")}
    public init(f: () -> Unit) {
        callBack = f
    }

    ~init() {
        C.callBack()
    }
}

public func waitForFinalizer() {
    let caseTimeOut = Duration.second * 50
    synchronized(done) {
        @Assert(done.wait(timeout: caseTimeOut))
    }
}
