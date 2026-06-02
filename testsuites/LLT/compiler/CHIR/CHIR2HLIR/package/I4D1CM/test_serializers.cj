// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: types serializers
// EXEC:%compiler %import-cangjie-stdx %compile_lib_opt types/*.cj -o types.%middle
// EXEC:%compiler %import-cangjie-stdx %compile_lib_opt serializers/*.cj -o serializers.%middle
// EXEC:%compiler  types.%middle serializers.%middle %import-cangjie-stdx %n.cj -o %n.%suffix
// EXEC: %set_stdx_path %run %run_opt %n.%suffix
internal import std.collection.*
internal import serializers.*
internal import types.*
internal import types.LinkedListNode as TLinkedListNode

func assertEqual(a: String, b: String) {
    if (!(a == b)) {
        print("assert failed! a: ${a}, b: ${b}\n")
        throw Exception()
    }
}

func test_serialize_int64() {
    assertEqual("3", serialize(3))
    assertEqual("2147483647", serialize(2147483647))
    assertEqual("-2147483648", serialize(-2147483648))
    assertEqual("9223372036854775807", serialize(9223372036854775807))
    assertEqual("-9223372036854775808", serialize(-9223372036854775808))
}

func test_serialize_float64() {
    assertEqual("3.34000", serialize(3.34))
    assertEqual("3.34396", serialize(3.343956))
    assertEqual("3.34395", serialize(3.343952))
    assertEqual("3.00000", serialize(3.0))
}

func test_serialize_char() {
    assertEqual("\" \"", serialize(r' '))
    assertEqual("\"\\\"", serialize(r'\\'))
    assertEqual("\"\"\"", serialize(r'"'))
    assertEqual("\"a\"", serialize(r'a'))
    assertEqual("\"\n\"", serialize(r'\n'))
    assertEqual("\"🐎\"", serialize(r'🐎'))
}

func test_serialize_string() {
    assertEqual("\"3.34\"", serialize("3.34"))
    assertEqual("\"Hello\\nWorld\"", serialize("Hello\nWorld"))
    assertEqual("\"a\\nb\\fc\\td\\be\\r/6f\\\\g\"", serialize("a\nb\fc\td\be\r/6f\\g"))
    assertEqual("\"认识你的美\"", serialize("认识你的美"))
}

func test_serialize_char_array() {
    assertEqual("[]", serialize(Array<Rune>()))
    assertEqual("[\"H\",\"e\",\"l\",\"l\",\"o\",\"\n\",\"W\",\"o\",\"r\",\"l\",\"d\"]",
        serialize([r'H', r'e', r'l', r'l', r'o', r'\n', r'W', r'o', r'r', r'l', r'd']))
}

func test_serialize_char_list() {
    assertEqual("[]", serialize(ArrayList<Rune>()))
    assertEqual("[\"H\",\"e\",\"l\",\"l\",\"o\",\"\n\",\"W\",\"o\",\"r\",\"l\",\"d\"]",
        serialize(ArrayList<Rune>([r'H', r'e', r'l', r'l', r'o', r'\n', r'W', r'o', r'r', r'l', r'd'])))
}

func test_serialize_bool() {
    assertEqual("true", serialize(true))
    assertEqual("false", serialize(false))
}

func test_serialize_array() {
    assertEqual("[1,4,2,5]", serialize([1, 4, 2, 5]))
    assertEqual("[[1,10,3,5],[2,-1,0],[]]", serialize([[1, 10, 3, 5], [2, -1, 0], []]))
    assertEqual("[6.00000,0.50000,1.00000,-1.00000,0.00000]", serialize([6.0f64, 0.5f64, 1.0f64, -1.0f64, 0.0f64]))
    assertEqual("[[6.00000,0.50000,1.00000],[1.36667],[9.11513,12.12311]]",
        serialize([[6.0f64, 0.5f64, 1.0f64], [1.36666666f64], [9.115125f64, 12.1231121f64]]))
    assertEqual("[[\"0\",\"2\",\"1\",\"3\"],[\"a\",\"1\",\"3\"],[]]",
        serialize([[r'0', r'2', r'1', r'3'], [r'a', r'1', r'3'], []]))
    assertEqual("[]", serialize(Array<Array<String>>()))
    assertEqual("[[\"0333\",\"2\",\"1\",\"3\"],[\"abx\",\"1\",\"3\"],[]]",
        serialize([["0333", "2", "1", "3"], ["abx", "1", "3"], Array<String>()]))
    assertEqual("[false,true]", serialize([false, true]))
}

func test_serialize_list() {
    assertEqual("[1,4,2,5]", serialize(ArrayList<Int64>([1, 4, 2, 5])))
    assertEqual("[[1,10,3,5],[2,-1,0],[]]",
        serialize(
            ArrayList<ArrayList<Int64>>([ArrayList<Int64>([1, 10, 3, 5]), ArrayList<Int64>([2, -1, 0]),
                ArrayList<Int64>([])])))
    assertEqual("[6.00000,0.50000,1.00000,-1.00000,0.00000]", serialize(ArrayList<Float64>([6.0, 0.5, 1.0, -1.0, 0.0])))
    assertEqual("[[6.00000,0.50000,1.00000],[1.36667],[9.11513,12.12311]]",
        serialize(
            ArrayList<ArrayList<Float64>>(
                [ArrayList<Float64>([6.0, 0.5, 1.0]), ArrayList<Float64>([1.36666666]),
                    ArrayList<Float64>([9.115125, 12.1231121])])))
    assertEqual("[[\"0\",\"2\",\"1\",\"3\"],[\"a\",\"1\",\"3\"],[]]",
        serialize(
            ArrayList<ArrayList<Rune>>(
                [ArrayList<Rune>([r'0', r'2', r'1', r'3']), ArrayList<Rune>([r'a', r'1', r'3']), ArrayList<Rune>([])])))
    assertEqual("[]", serialize(ArrayList<ArrayList<String>>()))
    assertEqual("[[\"0333\",\"2\",\"1\",\"3\"],[\"abx\",\"1\",\"3\"],[]]",
        serialize(
            ArrayList<ArrayList<String>>(
                [ArrayList<String>(["0333", "2", "1", "3"]), ArrayList<String>(["abx", "1", "3"]), ArrayList<String>([])]
            )))
    assertEqual("[false,true]", serialize(ArrayList<Bool>([false, true])))
}

func test_serialize_listnode() {
    let n3 = TLinkedListNode(3)
    let n2 = TLinkedListNode(2)
    n2.next = n3
    let n1 = TLinkedListNode(1)
    n1.next = n2
    let x1 = TLinkedListNode(4)

    assertEqual(serialize(n1), "[1,2,3]")
    assertEqual(serialize(Option<TLinkedListNode>.None), "[]")
    assertEqual(serialize([n1, x1]), "[[1,2,3],[4]]")
    assertEqual(serialize([Option<TLinkedListNode>.None, n1, Option<TLinkedListNode>.None]), "[[],[1,2,3],[]]")
}

func test_serialize_TreeNodeSer() {
    let n3 = TreeNodeSer(3)
    let n2 = TreeNodeSer(2)
    n2.left = n3
    let n1 = TreeNodeSer(1)
    n1.right = n2
    let x1 = TreeNodeSer(4)
    let x2 = TreeNodeSer(5)
    x2.right = n1

    assertEqual(serialize(n1), "[1,null,2,3]")
    assertEqual(serialize(x2), "[5,null,1,null,2,3]")
    assertEqual(serialize(Option<TreeNodeSer>.None), "[]")
    assertEqual(serialize([n1, x1]), "[[1,null,2,3],[4]]")
    assertEqual(serialize([Option<TreeNodeSer>.None, n1, Option<TreeNodeSer>.None]), "[[],[1,null,2,3],[]]")
    assertEqual(serialize([Some<TreeNodeSer>(n1), Some<TreeNodeSer>(x1)]), "[[1,null,2,3],[4]]")
    assertEqual(serialize(ArrayList<?TreeNodeSer>([n1, x1])), "[[1,null,2,3],[4]]")
}

main() {
    print("Testing serializers...\n")
    test_serialize_int64()
    test_serialize_float64()
    test_serialize_char()
    test_serialize_string()
    test_serialize_char_array()
    test_serialize_char_list()
    test_serialize_bool()
    test_serialize_array()
    test_serialize_list()
    test_serialize_listnode()
    test_serialize_TreeNodeSer()
    print("All tests passed!\n")
}
