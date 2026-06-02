/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Depth: 0
// ASSERT: scan Depth: 1
// ASSERT: scan Depth: 2
// ASSERT: scan Depth: 1
// ASSERT: scan Depth: 0
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.*

public class GetDepth <: Command<Int64> {
    public func defaultImpl(): Int64 {
        0
    }
}

func deeper<T>(f: () -> T): Unit {
    try {
        f()
    } handle(e: GetDepth) {
        resume with ((perform e) + 1)
    }
}

main() {
    println("Depth: ${perform GetDepth()}")
    deeper {
        println("Depth: ${perform GetDepth()}")
        deeper {
            println("Depth: ${perform GetDepth()}")
        }
        println("Depth: ${perform GetDepth()}")
    }
    println("Depth: ${perform GetDepth()}")
}
