/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan P.02
// ASSERT: scan the same variable is protected by different mutex

import std.sync.*
var m1 = ReentrantMutex()
var m2 = m1

interface I<T> {
    static func test<K, V>() {
        var a = 1
        a
    }
}
var a = I<Int64>.test<Int64, Int32>()
func temp0<T>() {
      spawn {
          m1.lock()
          a = 2
          m1.unlock()
      }
}

func temp1<T>() {
      spawn {
          m2.lock()
          a = 2
          m2.unlock()
      }
}

main() {}
