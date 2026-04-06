/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not iOS) EXEC: %compiler %cmp_opt --output-type=exe %f
// (not Windows and OHOS) EXEC: %ls main
// (Windows and not OHOS) EXEC: %ls main.exe

main(): Int64 {
    return run()
}

func run(): Int64 {
    var b: Base = Base()
    return 0
}

class Base {
    public var a: Int32 = 3
}
