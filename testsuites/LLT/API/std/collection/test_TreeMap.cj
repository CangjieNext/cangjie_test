/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*

func isNoneTuple<K, V>(tup: Option<(K, V)>): Bool {
    match (tup) {
        case Some(_) => false
        case None => true
    }
}

func isNoneValue<V>(value: Option<V>): Bool {
    match (value) {
        case Some(_) => false
        case None => true
    }
}

func isNoneNode<K, V>(treeNode: Option<MapEntryView<K, V>>): Bool where K <: Comparable<K> {
    match (treeNode) {
        case Some(_) => false
        case None => true
    }
}

func isEmptyIterator<K, V>(iter: Iterator<(K, V)>): Bool {
    for (_ in iter) {
        return false
    }
    return true
}

let elementsRemove: Array<(String, Int64)> = [("赵", 1), ("钱", 2), ("孙", 3), ("李", 4), ("Y", 57), ("z", 58), ("😃", 59),
    ("(●'◡'●)", 60), ("周", 5), ("吴", 6), ("郑", 7), ("王", 8), ("a", 33), ("B", 34), ("c", 35), ("D", 36), ("冯", 9),
    ("陈", 10), ("褚", 11), ("卫", 12), ("蒋", 13), ("沈", 14), ("韩", 15), ("杨", 16), ("i", 41), ("G", 42), ("K", 43),
    ("l", 44), ("朱", 17), ("秦", 18), ("尤", 19), ("许", 20), ("何", 21), ("吕", 22), ("施", 23), ("张", 24), ("Q", 49),
    ("r", 50), ("S", 51), ("t", 52), ("孔", 25), ("曹", 26), ("严", 27), ("华", 28), ("U", 53), ("v", 54), ("W", 55),
    ("x", 56), ("金", 29), ("魏", 30), ("陶", 31), ("姜", 32), ("e", 37), ("F", 38), ("g", 39), ("H", 40), ("M", 45),
    ("n", 46), ("O", 47), ("p", 48), ("戚", 45), ("谢", 46), ("邹", 47), ("喻", 48), ("柏", 49), ("水", 50), ("窦", 51),
    ("章", 52), ("云", 53), ("苏", 54), ("潘", 55), ("葛", 56), ("奚", 57), ("范", 58), ("彭", 59), ("郎", 60),
    ("鲁", 61), ("韦", 62), ("昌", 63), ("马", 64), ("苗", 65), ("凤", 66), ("花", 67), ("方", 68), ("俞", 69),
    ("任", 70), ("袁", 71), ("柳", 72), ("酆", 73), ("鲍", 74), ("史", 75), ("唐", 76), ("费", 77), ("廉", 78),
    ("岑", 79), ("薛", 80), ("雷", 81), ("贺", 82), ("倪", 83), ("汤", 84), ("滕", 85), ("殷", 86), ("罗", 87),
    ("毕", 88), ("郝", 89), ("邬", 90), ("安", 91), ("常", 92), ("乐", 93), ("于", 94), ("时", 95), ("傅", 96), ("😢", 97),
    ("😊", 98), ("😂", 99), ("🤣", 100), ("<", 101), (">", 102), (":", 103), (";", 104), ("❤", 105), ("🧡", 106), ("💛", 107),
    ("💚", 108), ("💙", 109), ("💜", 110), ("🤎", 111), ("🖤", 112), ("℃", 113), ("¥", 114), ("£", 115), ("′", 116),
    ("㎜", 117), ("㏎", 118), ("㏄", 119), ("¤", 120), ("1", 121), ("3", 122), ("5", 123), ("7", 124), ("9", 125),
    ("2", 126), ("4", 127), ("6", 128), ("!", 129), ("@", 130), ("#", 131), ("%", 132), ("^", 133), ("&", 134),
    ("*", 135), ("()", 136), ("←", 137), ("↓", 138), ("↖", 139), ("↙", 140), ("↑", 141), ("↔", 142), ("↗", 143),
    ("⇠", 144)]
let elementsNames: Array<(String, Int64)> = [("赵", 1), ("钱", 2), ("孙", 3), ("李", 4), ("周", 5), ("吴", 6), ("郑", 7),
    ("王", 8), ("冯", 9), ("陈", 10), ("褚", 11), ("卫", 12), ("蒋", 13), ("沈", 14), ("韩", 15), ("杨", 16), ("朱", 17),
    ("秦", 18), ("尤", 19), ("许", 20), ("何", 21), ("吕", 22), ("施", 23), ("张", 24)]

@Test
class TreeMapTest {
    @TestCase
    func initWithoutParameter(): Unit {
        var map1: TreeMap<String, String> = TreeMap<String, String>()
        @Expect(map1.size, 0)
        var map2: TreeMap<String, Int64> = TreeMap<String, Int64>()
        @Expect(map2.size, 0)

        var map3: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map3.size, 0)
    }

    @TestCase
    func initByCollection(): Unit {
        var col: Collection<(Int64, Int64)> = [(1, 2), (2, 3), (3, 4)]
        var map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(col)
        var res: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>([(1, 2), (2, 3), (3, 4)])
        @Expect(map.size, 3)
        @Expect(map, res)
    }

    @TestCase
    func initByArray(): Unit {
        var arr: Array<(Int64, Int64)> = [(3, 4), (2, 3), (1, 2)]
        var map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(arr)
        var res: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>([(1, 2), (2, 3), (3, 4)])
        @Expect(map.size, 3)
        @Expect(map, res)

        const N: Int64 = 300000
        let elements1 = Array<(Int64, Int64)>(N, {i => (i, i + 5)})
        let treemap1 = TreeMap<Int64, Int64>(elements1)

        let res1 = Array<Int64>(N, repeat: -1)
        let resArr1 = Array<Int64>(N, {i => i + 5})
        for ((k, v) in treemap1) {
            res1[k] = v
        }
        @Expect(res1,resArr1)

        let elements2 = HashMap<String, Int64>(
            [("赵", 1), ("钱", 2), ("孙", 3), ("李", 4), ("周", 5), ("吴", 6), ("郑", 7), ("王", 8), ("冯", 9),
                ("陈", 10), ("褚", 11), ("卫", 12), ("蒋", 13), ("沈", 14), ("韩", 15), ("杨", 16)])
        let treemap2 = TreeMap<String, Int64>(elements2)
        let size = treemap2.size

        let res2 = Array<Int64>(size, repeat: -1)
        let resArr2: Array<Int64> = [9, 12, 6, 5, 3, 4, 16, 14, 8, 13, 11, 1, 7, 2, 10, 15]
        var i = 0
        for ((_, v) in treemap2) {
            res2[i] = v
            i++
        }

        @Expect(res2,resArr2)
    }

    @TestCase
    func initByFunction(): Unit {
        var map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        var res1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map.size, 10)
        @Expect(map, res1)

        try {
            var _ = TreeMap<Int64, Int64>(-10, {K => (K, K)})
            @Expect("Should throw exception", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid size of TreeMap: -10.")
        }

        const N: Int64 = 1000
        let treemap = TreeMap<Int64, Int64>(N, {i => (N - 1 - i, N - 1 - i)})
        let size = treemap.size

        let res2 = Array<Int64>(size, repeat: -1)
        let resArr = Array<Int64>(N, {i => i})
        for ((k, v) in treemap) {
            res2[k] = v
        }

        @Expect(res2,resArr)

        try {
            let _ = TreeMap<Int64, Int64>(-1, {i => (i, i)})
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid size of TreeMap: -1.")
        }
    }

    @TestCase
    func clone(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map1.clone().isEmpty())
        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        var map22 = map2.clone()
        @Expect(!map22.isEmpty())
        @Expect(map22.size, 10)
    }

    @TestCase
    func iterator(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        try {
            map1.iterator().next().getOrThrow()
            @Expect("Should throw exception", "map1.iterator().next().getOrThrow()")
        } catch (e: Exception) {
            @Expect(e.message, "")
        }

        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        var iter2 = map2.iterator()
        var keyValue2 = iter2.next().getOrThrow()
        @Expect(keyValue2[0], 0)
        @Expect(keyValue2[1], 0)

        let treemap = TreeMap<String, Int64>(elementsNames)
        let iter3 = treemap.iterator()
        for ((k, v) in iter3) {
            @Expect(treemap[k], v)
        }

        treemap.removeFirst()
        @Expect(treemap.size, 23)

        try {
            iter3.next()
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }
    }

    @TestCase
    func backwardAndForward(): Unit {
        let treemap = TreeMap<Int64, Int64>(5, {x: Int64 => (2 * x, 2 * x)})
        // Exist Key
        @Expect(treemap.forward(2, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>(4, {x: Int64 => (2*(x+1), 2*(x+1))}))
        @Expect(treemap.forward(2, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>(3, {x: Int64 => (2*(x+2), 2*(x+2))}))

        @Expect(treemap.backward(2, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>((2, 2), (0, 0)))
        @Expect(treemap.backward(2, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>((0, 0)))

        @Expect(treemap.forward(0, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))
        @Expect(treemap.forward(0, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>((2, 2), (4, 4), (6, 6), (8, 8)))

        @Expect(treemap.backward(8, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))
        @Expect(treemap.backward(8, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>((0, 0), (2, 2), (4, 4), (6, 6)))

        // Not exist key
        @Expect(treemap.backward(10, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))
        @Expect(treemap.backward(10, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))

        @Expect(treemap.forward(-10, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))
        @Expect(treemap.forward(-10, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>(5, {x: Int64 => (2*x, 2*x)}))

        @Expect(treemap.backward(3, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>((0, 0), (2, 2)))
        @Expect(treemap.backward(3, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>((0, 0), (2, 2)))

        @Expect(treemap.forward(3, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>((4, 4), (6, 6), (8, 8)))
        @Expect(treemap.forward(3, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>((4, 4), (6, 6), (8, 8)))

        @Expect(treemap.forward(10, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>())
        @Expect(treemap.forward(10, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>())

        @Expect(treemap.backward(-11, inclusive: true) |> collectHashMap, HashMap<Int64, Int64>())
        @Expect(treemap.backward(-11, inclusive: false) |> collectHashMap, HashMap<Int64, Int64>())
    }

    @TestCase
    func toString(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map1.toString(), "[]")
        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        @Expect(map2.toString(),
            "[(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)]")
    }

    @TestCase
    func firstEntryGetAndPop(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(isNoneTuple(map1.removeFirst()))
        @Expect(isNoneTuple(map1.first))

        let treemap = TreeMap<String, Int64>(elementsNames)
        var first = treemap.first.getOrThrow()
        @Expect(first[0], "何")
        @Expect(first[1], 21)

        first = treemap.removeFirst().getOrThrow()
        @Expect(first[0], "何")
        @Expect(first[1], 21)

        first = treemap.first.getOrThrow()
        @Expect(first[0], "冯")
        @Expect(first[1], 9)

        treemap.removeIf({k, _ => (k >= "冯" && k < "韩")})
        first = treemap.first.getOrThrow()
        @Expect(first[0], "韩")
        @Expect(first[1], 15)

        first = treemap.removeFirst().getOrThrow()
        @Expect(first[0], "韩")
        @Expect(first[1], 15)

        @Assert(isNoneTuple(treemap.removeFirst()))
        @Assert(isNoneTuple(treemap.first))
        @Expect(treemap.toString(), "[]")
    }

    @TestCase
    func lastEntryGetAndPop(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(isNoneTuple(map1.removeLast()))
        @Expect(isNoneTuple(map1.last))

        let treemap = TreeMap<String, Int64>(elementsNames)
        var last = treemap.last.getOrThrow()
        @Expect(last[0], "韩")
        @Expect(last[1], 15)

        last = treemap.removeLast().getOrThrow()
        @Expect(last[0], "韩")
        @Expect(last[1], 15)

        last = treemap.last.getOrThrow()
        @Expect(last[0], "陈")
        @Expect(last[1], 10)

        treemap.removeIf({k, _ => (k >= "何" && k < "陈")})
        last = treemap.last.getOrThrow()
        @Expect(last[0], "陈")
        @Expect(last[1], 10)
        last = treemap.removeLast().getOrThrow()
        @Expect(last[0], "陈")
        @Expect(last[1], 10)

        @Assert(isNoneTuple(treemap.removeLast()))
        @Assert(isNoneTuple(treemap.last))
        @Expect(treemap.toString(), "[]")
    }

    @TestCase
    func OrderedMapEntryView(): Unit {
        var treemap: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>((0, 0), (2, 22), (4, 4), (8, 8))

        var node1 = treemap.entryView(2)
        @Expect(node1.key, 2)
        @Expect(node1.value, 22)
        node1.value = 2

        var sum = 0
        var node2 = treemap.entryView(-1)
        @Expect(node2.key, -1)

        try {
            node2.value
        } catch (e: NoneValueException) {
            sum += 1
        }

        let view = treemap.entryView(1)
        view.value = 1
        @Expect(treemap.get(1), 1)
        @Expect(view.value, 1)
        @Expect(sum, 0)

        let treemap3: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>((1, 1))
        let view3 = treemap3.entryView(1)
        view3.value = None
        view3.value = Some(11)
        @Expect(view3.value, Some(11))
    }

    @TestCase
    func nodeConcurrentModificationException(): Unit {
        const N: Int64 = 36
        let treemap = TreeMap<Int64, Int64>(N, {i => (2 * i - 36, i)})
        var iter = treemap.backward(0, inclusive: true)
        var node = treemap.entryView(iter.next().getOrThrow()[0])
        node.value = 100
        @Expect(node.value, 100)

        treemap.add(0, 101)
        @Expect(node.value, 101)

        treemap.remove(node.key)
        try {
            node.key == 102
            @Expect("Should throw exception", "node.key == 102")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        try {
            node.value = 102
            @Expect("Should throw exception", "node.value = 102")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        try {
            node.value == 102
            @Expect("Should throw exception", "node.value == 102")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        try {
            iter.next
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        try {
            treemap.backward(node.key, inclusive: true)
            @Expect("Should throw exception", "node.prev()")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        iter = treemap.backward(38, inclusive: true)
        node = treemap.entryView(iter.next().getOrThrow()[0])
        @Expect(node.key, 34)
        treemap.removeLast()
        try {
            iter.next()
            @Expect("Should throw exception", "node.forward(29)")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        iter = treemap.forward(30, inclusive: false)
        node = treemap.entryView(iter.next().getOrThrow()[0])
        @Expect(node.key, 32)
        treemap.add(99, 99)
        try {
            iter.next()
            @Expect("Should throw exception", "tree.backward(99)")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }
    }

    @TestCase
    func getAndOperatorGet(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map1.get(1), Option<Int64>.None)
        try {
            var _ = map1[1]
            @Expect("Should throw exception", "var _ = map1[1]")
        } catch (e: NoneValueException) {
            @Expect(e.message, "Value does not exist!")
        }

        let eleNames: Array<(String, Int64)> = [("赵", 1), ("钱", 2), ("孙", 3), ("李", 4), ("周", 5), ("吴", 6),
            ("郑", 7), ("王", 8), ("冯", 9), ("陈", 10), ("褚", 11), ("卫", 12), ("蒋", 13), ("沈", 14), ("韩", 15),
            ("杨", 16)]
        let treemap = TreeMap<String, Int64>(eleNames)
        let size = treemap.size

        let res = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨"]
        let resArr1 = Array<Int64>(size, repeat: -1)
        let resArr2 = Array<Int64>(size, {i => i + 1})
        for (i in 0..size) {
            resArr1[i] = treemap.get(res[i]).getOrThrow()
        }

        @Assert(isNoneValue(treemap.get("赵\0")))

        @Expect(resArr1,resArr2)
    }

    @TestCase
    func containsAndAll(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(!map1.contains(1))
        @Expect(!map1.contains(all: [1, 2]))

        let treemap = TreeMap<String, Int64>(elementsNames)
        let elements1 = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨",
            "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        for (key in elements1) {
            @Expect(treemap.contains(key),true)
        }

        let elements2 = ["赵 ", "钱\b", "孙\n", "李\0", "周`", "吴  ", "郑\u{123}", "王\t", "冯\\"]
        for (key in elements2) {
            @Expect(treemap.contains(key),false)
        }

        let elements11 = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨",
            "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        @Expect(treemap.contains(all: elements11),true)

        let elements22 = ["赵 ", "钱\b", "孙\n", "李\0", "周`", "吴  ", "郑\u{123}", "王\t", "冯\\"]
        @Expect(treemap.contains(all: elements22),false)

        let elements33 = ["陈", "褚", "卫shi", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        @Expect(treemap.contains(all: elements33),false)
    }

    @TestCase
    func addAndAllAndOperator(): Unit {
        let treemap = TreeMap<String, Int64>()
        @Expect(treemap.size, 0)
        for ((k, v) in elementsNames) {
            treemap.add(k, v)
        }
        @Expect(treemap.size, 24)
        let strNames1: String = "[(何, 21), (冯, 9), (卫, 12), (吕, 22), (吴, 6), (周, 5), (孙, 3), (尤, 19), (张, 24), (施, 23), (朱, 17), (李, 4), (杨, 16), (沈, 14), (王, 8), (秦, 18), (蒋, 13), (褚, 11), (许, 20), (赵, 1), (郑, 7), (钱, 2), (陈, 10), (韩, 15)]"
        @Expect(treemap.toString(), strNames1)

        let elements1 = [("赵", 11), ("吴", 66), ("褚", 111), ("杨", 166), ("尤", 199), ("吕", 222), ("a", 96), ("b", 97)]

        treemap.add(all: elements1)
        @Expect(treemap.size, 26)

        var res = [("赵", 11), ("吴", 66), ("褚", 111), ("杨", 166), ("尤", 199), ("吕", 222)]
        for (tup in res) {
            @Expect(treemap.get(tup[0]).getOrThrow(), tup[1])
        }

        var value: ?Int64 = treemap.add("测试", 369)
        @Assert(isNoneValue(value))
        value = treemap.add("测试", 963)
        @Expect(value.getOrThrow(), 369)

        let strNames2: String = "[(a, 96), (b, 97), (何, 21), (冯, 9), (卫, 12), (吕, 222), (吴, 66), (周, 5), (孙, 3), (尤, 199), (张, 24), (施, 23), (朱, 17), (李, 4), (杨, 166), (沈, 14), (测试, 963), (王, 8), (秦, 18), (蒋, 13), (褚, 111), (许, 20), (赵, 11), (郑, 7), (钱, 2), (陈, 10), (韩, 15)]"
        @Expect(treemap.toString(), strNames2)
    }

    @TestCase
    func removeAndAllAndIfAndClear(): Unit {
        var map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x => (x, x * x)})
        @Expect(map.remove(0).getOrThrow(), 0)
        @Expect(isNoneValue(map.remove(0)))
        @Expect(isNoneValue(map.remove(10)))

        map.remove(all: [-2, 0, 1, 8])
        @Expect(isNoneValue(map.get(1)))
        @Expect(isNoneValue(map.get(8)))

        map.removeIf({key, _ => (key % 2 == 0)})
        @Expect(map.size, 4)
        @Expect(map.get(3).getOrThrow(), 9)
        @Expect(map.get(5).getOrThrow(), 25)
        @Expect(map.get(7).getOrThrow(), 49)
        @Expect(map.get(9).getOrThrow(), 81)

        map.clear()
        @Expect(map.size, 0)

        let treemap = TreeMap<String, Int64>(elementsRemove)
        let resStrRemove1: String = "[(!, 129), (#, 131), (%, 132), (&, 134), ((), 136), ((●'◡'●), 60), (*, 135), (1, 121), (2, 126), (3, 122), (4, 127), (5, 123), (6, 128), (7, 124), (9, 125), (:, 103), (;, 104), (<, 101), (>, 102), (@, 130), (B, 34), (D, 36), (F, 38), (G, 42), (H, 40), (K, 43), (M, 45), (O, 47), (Q, 49), (S, 51), (U, 53), (W, 55), (Y, 57), (^, 133), (a, 33), (c, 35), (e, 37), (g, 39), (i, 41), (l, 44), (n, 46), (p, 48), (r, 50), (t, 52), (v, 54), (x, 56), (z, 58), (£, 115), (¤, 120), (¥, 114), (′, 116), (℃, 113), (←, 137), (↑, 141), (↓, 138), (↔, 142), (↖, 139), (↗, 143), (↙, 140), (⇠, 144), (❤, 105), (㎜, 117), (㏄, 119), (㏎, 118), (严, 27), (乐, 93), (于, 94), (云, 53), (任, 70), (何, 21), (俞, 69), (倪, 83), (傅, 96), (冯, 9), (凤, 66), (华, 28), (卫, 12), (史, 75), (吕, 22), (吴, 6), (周, 5), (唐, 76), (喻, 48), (奚, 57), (姜, 32), (孔, 25), (孙, 3), (安, 91), (尤, 19), (岑, 79), (常, 92), (廉, 78), (张, 24), (彭, 59), (戚, 45), (方, 68), (施, 23), (时, 95), (昌, 63), (曹, 26), (朱, 17), (李, 4), (杨, 16), (柏, 49), (柳, 72), (殷, 86), (毕, 88), (水, 50), (汤, 84), (沈, 14), (滕, 85), (潘, 55), (王, 8), (秦, 18), (窦, 51), (章, 52), (罗, 87), (花, 67), (苏, 54), (苗, 65), (范, 58), (葛, 56), (蒋, 13), (薛, 80), (袁, 71), (褚, 11), (许, 20), (谢, 46), (费, 77), (贺, 82), (赵, 1), (邬, 90), (邹, 47), (郎, 60), (郑, 7), (郝, 89), (酆, 73), (金, 29), (钱, 2), (陈, 10), (陶, 31), (雷, 81), (韦, 62), (韩, 15), (马, 64), (魏, 30), (鲁, 61), (鲍, 74), (💙, 109), (💚, 108), (💛, 107), (💜, 110), (🖤, 112), (😂, 99), (😃, 59), (😊, 98), (😢, 97), (🤎, 111), (🤣, 100), (🧡, 106)]"
        @Expect(treemap.toString(), resStrRemove1)

        var size = elementsRemove.size
        @Expect(treemap.size, size)
        let results = [("孙", 3), ("3", 122), (":", 103), ("❤", 105), ("魏", 30), ("😂", 99)]
        for (result in results) {
            @Expect(treemap.remove(result[0]).getOrThrow(), result[1])
            size--
            @Expect(treemap.size, size)
        }
        @Assert(isNoneValue(treemap.remove("None")))

        treemap.removeIf({k, _ => k <= "a"})
        @Expect(treemap.size, elementsRemove.size - 39)
        treemap.removeIf({_, v => (v >= 89 && v < 101)})
        @Expect(treemap.size, elementsRemove.size - 50)
        treemap.removeIf({k, _ => (k >= "吴" && k <= "曹")})
        @Expect(treemap.size, elementsRemove.size - 67)
        let resStrRemove2: String = "[(c, 35), (e, 37), (g, 39), (i, 41), (l, 44), (n, 46), (p, 48), (r, 50), (t, 52), (v, 54), (x, 56), (z, 58), (£, 115), (¤, 120), (¥, 114), (′, 116), (℃, 113), (←, 137), (↑, 141), (↓, 138), (↔, 142), (↖, 139), (↗, 143), (↙, 140), (⇠, 144), (㎜, 117), (㏄, 119), (㏎, 118), (严, 27), (云, 53), (任, 70), (何, 21), (俞, 69), (倪, 83), (冯, 9), (凤, 66), (华, 28), (卫, 12), (史, 75), (吕, 22), (朱, 17), (李, 4), (杨, 16), (柏, 49), (柳, 72), (殷, 86), (毕, 88), (水, 50), (汤, 84), (沈, 14), (滕, 85), (潘, 55), (王, 8), (秦, 18), (窦, 51), (章, 52), (罗, 87), (花, 67), (苏, 54), (苗, 65), (范, 58), (葛, 56), (蒋, 13), (薛, 80), (袁, 71), (褚, 11), (许, 20), (谢, 46), (费, 77), (贺, 82), (赵, 1), (邹, 47), (郎, 60), (郑, 7), (酆, 73), (金, 29), (钱, 2), (陈, 10), (陶, 31), (雷, 81), (韦, 62), (韩, 15), (马, 64), (鲁, 61), (鲍, 74), (💙, 109), (💚, 108), (💛, 107), (💜, 110), (🖤, 112), (😃, 59), (🤎, 111), (🧡, 106)]"
        @Expect(treemap.toString(), resStrRemove2)

        let elements1 = ["c", "e", "g", "i", "l", "n", "p", "r", "t", "v", "x", "z", "£", "¤", "¥", "′", "℃", "←", "↑",
            "↓", "↔", "↖", "↗", "↙", "⇠", "㎜", "㏄", "㏎"]
        treemap.remove(all: elements1)
        @Expect(treemap.size, elementsRemove.size - 95)
        let elements2 = ArrayList<String>()
        for ((k, _) in elementsRemove) {
            elements2.add(k)
        }
        treemap.remove(all: elements2)
        @Expect(treemap.isEmpty())

        treemap.add("a", 101)
        treemap.removeIf({k, _ => (k == "a")})
        @Expect(treemap.size, 0)

        treemap.add(all: elementsRemove)
        treemap.removeIf({k, _ => (k >= "张" && k <= "鲍")})
        let resStrRemove3: String = "[(!, 129), (#, 131), (%, 132), (&, 134), ((), 136), ((●'◡'●), 60), (*, 135), (1, 121), (2, 126), (3, 122), (4, 127), (5, 123), (6, 128), (7, 124), (9, 125), (:, 103), (;, 104), (<, 101), (>, 102), (@, 130), (B, 34), (D, 36), (F, 38), (G, 42), (H, 40), (K, 43), (M, 45), (O, 47), (Q, 49), (S, 51), (U, 53), (W, 55), (Y, 57), (^, 133), (a, 33), (c, 35), (e, 37), (g, 39), (i, 41), (l, 44), (n, 46), (p, 48), (r, 50), (t, 52), (v, 54), (x, 56), (z, 58), (£, 115), (¤, 120), (¥, 114), (′, 116), (℃, 113), (←, 137), (↑, 141), (↓, 138), (↔, 142), (↖, 139), (↗, 143), (↙, 140), (⇠, 144), (❤, 105), (㎜, 117), (㏄, 119), (㏎, 118), (严, 27), (乐, 93), (于, 94), (云, 53), (任, 70), (何, 21), (俞, 69), (倪, 83), (傅, 96), (冯, 9), (凤, 66), (华, 28), (卫, 12), (史, 75), (吕, 22), (吴, 6), (周, 5), (唐, 76), (喻, 48), (奚, 57), (姜, 32), (孔, 25), (孙, 3), (安, 91), (尤, 19), (岑, 79), (常, 92), (廉, 78), (💙, 109), (💚, 108), (💛, 107), (💜, 110), (🖤, 112), (😂, 99), (😃, 59), (😊, 98), (😢, 97), (🤎, 111), (🤣, 100), (🧡, 106)]"
        @Expect(treemap.toString(), resStrRemove3)

        treemap.removeIf({k, _ => (k >= "!" && k <= ":")})
        treemap.removeIf({k, _ => (k >= "严" && k <= "廉")})
        let resStrRemove4: String = "[(;, 104), (<, 101), (>, 102), (@, 130), (B, 34), (D, 36), (F, 38), (G, 42), (H, 40), (K, 43), (M, 45), (O, 47), (Q, 49), (S, 51), (U, 53), (W, 55), (Y, 57), (^, 133), (a, 33), (c, 35), (e, 37), (g, 39), (i, 41), (l, 44), (n, 46), (p, 48), (r, 50), (t, 52), (v, 54), (x, 56), (z, 58), (£, 115), (¤, 120), (¥, 114), (′, 116), (℃, 113), (←, 137), (↑, 141), (↓, 138), (↔, 142), (↖, 139), (↗, 143), (↙, 140), (⇠, 144), (❤, 105), (㎜, 117), (㏄, 119), (㏎, 118), (💙, 109), (💚, 108), (💛, 107), (💜, 110), (🖤, 112), (😂, 99), (😃, 59), (😊, 98), (😢, 97), (🤎, 111), (🤣, 100), (🧡, 106)]"
        @Expect(treemap.toString(), resStrRemove4)
    }

    @TestCase
    func removeIfException(): Unit {
        let map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        try {
            map1.removeIf(
                {
                    key: Int64, _: Int64 =>
                    map1.remove(key)
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            map1.removeIf(
                {
                    _: Int64, _: Int64 =>
                    map1.removeLast()
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            map1.removeIf(
                {
                    _: Int64, _: Int64 =>
                    map1.removeFirst()
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        let map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        try {
            map2.removeIf(
                {
                    key: Int64, _: Int64 =>
                    map2.remove(key)
                    return true
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }

    @TestCase
    func removeIfPredicateClearException(): Unit {
        let map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        try {
            map.removeIf(
                {
                    _: Int64, _: Int64 =>
                    map.clear()
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }

    @TestCase
    func removeIfPredicateAddException(): Unit {
        let map: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        try {
            map.removeIf(
                {
                    _: Int64, _: Int64 =>
                    map.add(10, 100)
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            map.removeIf(
                {
                    _: Int64, _: Int64 =>
                    map.add(all: [(11, 121), (12, 144)])
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }

    @TestCase
    func sizeAndIsEmpty(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map1.size, 0)
        @Expect(map1.isEmpty())
        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x => (x, x * 2 + 1)})
        @Expect(map2.size, 10)
        @Expect(!map2.isEmpty())
    }

    @TestCase
    func keysAndValues(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        @Expect(map1.keys().isEmpty())
        @Expect(map1.values().isEmpty())
        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x => (x, x * 2 + 1)})
        @Expect(map2.keys().toArray(), Array<Int64>(10, {x => x}))
        @Expect(map2.values().toArray(), Array<Int64>(10, {x => (x * 2 + 1)}))
    }

    @TestCase
    func operatorEqualAndUnequal(): Unit {
        var map1: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        var map2: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>()
        var map3: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        var map4: TreeMap<Int64, Int64> = TreeMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map1 == map2)
        @Expect(map1 != map2, false)
        @Expect(map3 == map4)
        @Expect(map3 != map4, false)
        @Expect(map1 != map3)
        @Expect(map2 != map4)
    }
}
