// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
let var1059: Bool = (Option<((Range<Int8>, Range<Int16>))>.None is Int64)

main(): Int64 {
    if (func192() == true) {
        return 0;
    }
    return 1
}

public open class Class117 {
    public init() {}
    public open func func2864() { // block id: 2868
        true
    }
}

public func func192(): Bool { // block id: 195
    {
        =>
        let var2308: Bool = true
        func func1010(): Class117 { // block id: 1016
            {
                =>
                let var2305: Bool = true;
                func func2341(optionalParam2348!: () -> Class117 = func1010) { // block id: 2353
                    true
                }
                func func2294(): UInt8 { // block id: 2299
                    if ((if ((if (false) {
                        var2305
                    } else {
                        var2308
                    })) {
                        var1059
                    } else {
                        var2308
                    })) {
                        true
                    }
                    func2341()
                    UInt8(170)
                }
            }
            Class117()
        }
        func1010().func2864();
    }
    true
}
