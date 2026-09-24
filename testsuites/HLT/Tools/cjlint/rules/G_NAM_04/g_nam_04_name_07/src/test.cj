/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Stack {
    var elements: Array<Int64> = []
    func pop(): Option<Int64> {
        if (elements.size == 0) {
            return None<Int64>
        }
        return Some(elements[elements.size - 1])
    }
}

main() {
    let s = Stack()
    println(s.pop())
}
