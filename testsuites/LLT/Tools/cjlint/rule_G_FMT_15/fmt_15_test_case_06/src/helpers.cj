// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

extend Tokens {
    func toPtr(): Tokens {
        let v = this
        return quote(CPointer<$(v)>)
    }
}

public class Helpers {
    public static func blob(
        _: CjbindContext,
        layout: Layout
    ): Tokens {
        let opaque = layout.opaque()

        let ty = opaque.knownCjTypeForArray().getOrDefault {
            => 
            eprintln("Found unknown alignment on codegen")
            return quote(UInt8)
        }
    }
}