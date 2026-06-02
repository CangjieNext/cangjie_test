// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

class TestClass {
    @Frozen
    @Version["1.1"]
    func pf6(): Int64 {
        0
    }
}

main() {}
