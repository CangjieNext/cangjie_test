/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "Linux" && arch != "x86_64" && env == "xxxx"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
