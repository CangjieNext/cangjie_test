/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the LinkedList 算法及使用
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_use_test {

    // 括号匹配
    func isValid(s: String): Bool {
        var arr = s.toRuneArray()
        var linkedlist = LinkedList<Rune>()
        for (c in arr) {
            if (c == r'(' || c == r'[' || c == r'{') {
                linkedlist.addFirst(c)
            } else {
                if (!linkedlist.isEmpty()) {
                    if (c == r')') {
                        if (linkedlist.removeFirst().getOrThrow() != r'(') {
                            return false
                        }
                    } else if (c == r']') {
                        if (linkedlist.removeFirst().getOrThrow() != r'[') {
                            return false
                        }
                    } else if (c == r'}') {
                        if (linkedlist.removeFirst().getOrThrow() != r'{') {
                            return false
                        }
                    }
                } else {
                    return false
                }
            }
        }
        return linkedlist.isEmpty()
    }

    // 解析布尔表达式
    func parseBoolExpr(s: String) {
        var expression = LinkedList<Rune>(s.toRuneArray())
        var stack = LinkedList<Rune>()
        let n = expression.size
        for (i in 0..n) {
            var c = expression.nodeAt(i).getOrThrow().value
            if (c == r',') {
                continue
            } else if (c != r')') {
                stack.addLast(c)
            } else {
                var t = 0
                var f = 0
                while (stack.last.getOrThrow() != r'(') {
                    var cur = stack.removeLast().getOrThrow()
                    if (cur == r't') {
                        t++
                    } else if (cur == r'f') {
                        f++
                    }
                }
                stack.removeLast()
                var x = stack.removeLast().getOrThrow()
                if (x == r'!') {
                    if (f == 1) {
                        stack.addLast(r't')
                    } else {
                        stack.addLast(r'f')
                    }
                } else if (x == r'&') {
                    if (f == 0) {
                        stack.addLast(r't')
                    } else {
                        stack.addLast(r'f')
                    }
                } else if (x == r'|') {
                    if (t > 0) {
                        stack.addLast(r't')
                    } else {
                        stack.addLast(r'f')
                    }
                }
            }
        }
        return stack.removeLast().getOrThrow() == r't'
    }

    @TestCase
    func test_algorithms_isValid(): Unit {
        let s1: String = "{[()]}"
        let s2: String = "{[{()()[]{[()]}}]}"
        let s3: String = "{[(}]}"
        let ans1 = isValid(s1)
        let ans2 = isValid(s2)
        let ans3 = isValid(s3)
        @Expect(ans1, true)
        @Expect(ans2, true)
        @Expect(ans3, false)
    }

    @TestCase
    func test_algorithms_parseBoolExpr(): Unit {
        let ans4 = parseBoolExpr("&(|(f))")
        let ans5 = parseBoolExpr("|(f,f,f,t)")
        let ans6 = parseBoolExpr("!(&(f,t))")
        @Expect(ans4, false)
        @Expect(ans5, true)
        @Expect(ans6, true)
    }

    @TestCase
    func test_add(): Unit {
        // prepend
        let linkedlist1 = LinkedList<Int64>([-1])
        for (i in 0..10000) {
            linkedlist1.addFirst(i)
        }
        @Expect(linkedlist1.size, 10001)

        // append
        let linkedlist2 = LinkedList<Int64>([-1])
        for (i in 0..10000) {
            linkedlist2.addLast(i)
        }
        @Expect(linkedlist2.size, 10001)

        // insertBefore
        let linkedlist3 = LinkedList<Int64>([-1])
        for (i in 0..10000) {
            var node = linkedlist3.firstNode.getOrThrow()
            linkedlist3.addBefore(node, i)
        }
        @Expect(linkedlist3.size, 10001)

        // insertAfter
        let linkedlist4 = LinkedList<Int64>([-1])
        for (i in 0..10000) {
            var node = linkedlist4.lastNode.getOrThrow()
            linkedlist4.addAfter(node, i)
        }
        @Expect(linkedlist4.size, 10001)
    }

    @TestCase
    func test_delete(): Unit {
        // remove
        let linkedlist1 = LinkedList<Int64>(10000, {x => x})
        for (i in 0..10000) {
            var node = linkedlist1.firstNode.getOrThrow()
            linkedlist1.remove(node)
        }
        @Expect(linkedlist1.size, 0)
        @Expect(linkedlist1.isEmpty(), true)

        // removeIf
        let linkedlist2 = LinkedList<Int64>(10000, {x => x})
        func predicate(x: Int64): Bool {
            if (x >= 0) {
                return true
            }
            return false
        }
        linkedlist2.removeIf(predicate)
        @Expect(linkedlist2.size, 0)
        @Expect(linkedlist2.isEmpty(), true)

        // popFirst
        let linkedlist3 = LinkedList<Int64>(10000, {x => x})
        for (i in 0..10000) {
            linkedlist3.removeFirst()
        }
        @Expect(linkedlist3.size, 0)
        @Expect(linkedlist3.isEmpty(), true)

        // popLast
        let linkedlist4 = LinkedList<Int64>(10000, {x => x})
        for (i in 0..10000) {
            linkedlist4.removeLast()
        }
        @Expect(linkedlist4.size, 0)
        @Expect(linkedlist4.isEmpty(), true)
    }

    @TestCase
    func test_add_delete(): Unit {
        var linkedlist = LinkedList<Int64>()
        for (i in 0..10000) {
            linkedlist.addFirst(i)
            @Expect(linkedlist.size, 1)
            @Expect(linkedlist.isEmpty(), false)
            linkedlist.removeFirst()
            @Expect(linkedlist.size, 0)
            @Expect(linkedlist.isEmpty(), true)
            linkedlist.addLast(i)
            @Expect(linkedlist.size, 1)
            @Expect(linkedlist.isEmpty(), false)
            linkedlist.removeLast()
            @Expect(linkedlist.size, 0)
            @Expect(linkedlist.isEmpty(), true)
        }
    }
}
