/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.collection.*

let elementsNames: Array<String> = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈",
    "韩", "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
let elementsRemove: Array<String> = ["赵", "钱", "孙", "李", "Y", "z", "😃", "(●'◡'●)", "周", "吴", "郑", "王", "a", "B",
    "c", "D", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨", "i", "G", "K", "l", "朱", "秦", "尤", "许", "何", "吕",
    "施", "张", "Q", "r", "S", "t", "孔", "曹", "严", "华", "U", "v", "W", "x", "金", "魏", "陶", "姜", "e", "F", "g",
    "H", "M", "n", "O", "p", "戚", "谢", "邹", "喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范", "彭",
    "郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁", "柳", "酆", "鲍", "史", "唐", "费", "廉",
    "岑", "薛", "雷", "贺", "倪", "汤", "滕", "殷", "罗", "毕", "郝", "邬", "安", "常", "乐", "于", "时", "傅", "😢", "😊",
    "😂", "🤣", "<", ">", ":", ";", "❤", "🧡", "💛", "💚", "💙", "💜", "🤎", "🖤", "℃", "¥", "£", "′", "㎜", "㏎", "㏄", "¤", "1",
    "3", "5", "7", "9", "2", "4", "6", "!", "@", "#", "%", "^", "&", "*", "()", "←", "↓", "↖", "↙", "↑", "↔", "↗", "⇠"]

@Test
class TreeSetTest {
    @TestCase
    func initWithoutParameter(): Unit {
        var set1: TreeSet<String> = TreeSet<String>()
        @Expect(set1.size, 0)
        var set2: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set2.size, 0)
    }

    @TestCase
    func initByCollection(): Unit {
        var col: Collection<Int64> = [1, 2, 3, 4]
        var set: TreeSet<Int64> = TreeSet<Int64>(col)
        var res: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4])
        @Expect(set.size, 4)
        @Expect(set, res)
    }

    @TestCase
    func initByArray(): Unit {
        var arr: Array<Int64> = [1, 2, 3]
        var set: TreeSet<Int64> = TreeSet.of(arr)
        var res: TreeSet<Int64> = TreeSet.of(1, 2, 3)
        @Expect(set.size, 3)
        @Expect(set, res)
    }

    @TestCase
    func initByFunction(): Unit {
        var set: TreeSet<Int64> = TreeSet<Int64>(10, {x: Int64 => x * x})
        var res: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        @Expect(set.size, 10)
        @Expect(set, res)

        try {
            var _ = TreeSet<Int64>(-10, {K => K})
            @Expect("Should throw exception", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid size '-10': expected a non-negative value.")
        }
        try {
            let _ = TreeSet<Int64>(-1, {i => i})
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid size '-1': expected a non-negative value.")
        }
    }

    @TestCase
    func toString(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.toString(), "[]")
        var set2: TreeSet<Int64> = TreeSet<Int64>(10, {x: Int64 => x * x})
        @Expect(set2.toString(),
            "[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]")
    }

    @TestCase
    func firstPropAndRemoveFirst(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.removeFirst().isNone())
        @Expect(set1.first.isNone())

        let treeset = TreeSet<String>(elementsNames)
        var first = treeset.first.getOrThrow()
        @Expect(first, "何")

        first = treeset.removeFirst().getOrThrow()
        @Expect(first, "何")

        first = treeset.first.getOrThrow()
        @Expect(first, "冯")

        treeset.removeIf({k => (k >= "冯" && k < "韩")})
        first = treeset.first.getOrThrow()
        @Expect(first, "韩")

        first = treeset.removeFirst().getOrThrow()
        @Expect(first, "韩")

        @Assert(treeset.removeFirst().isNone())
        @Assert(treeset.first.isNone())
        @Expect(treeset.toString(), "[]")
    }

    @TestCase
    func lastPropAndRemoveLast(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.removeLast().isNone())
        @Expect(set1.last.isNone())

        let treeset = TreeSet<String>(elementsNames)
        var last = treeset.last.getOrThrow()
        @Expect(last, "韩")

        last = treeset.removeLast().getOrThrow()
        @Expect(last, "韩")

        last = treeset.last.getOrThrow()
        @Expect(last, "陈")

        treeset.removeIf({k => (k >= "何" && k < "陈")})
        last = treeset.last.getOrThrow()
        @Expect(last, "陈")
        last = treeset.removeLast().getOrThrow()
        @Expect(last, "陈")

        @Assert(treeset.removeLast().isNone())
        @Assert(treeset.last.isNone())
        @Expect(treeset.toString(), "[]")
    }

    @TestCase
    func containsAndAll(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(!set1.contains(1))
        @Expect(!set1.contains(all: [1, 2]))

        let treeset = TreeSet<String>(elementsNames)
        let elements1 = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨",
            "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        for (key in elements1) {
            @Expect(treeset.contains(key),true)
        }

        let elements2 = ["赵 ", "钱\b", "孙\n", "李\0", "周`", "吴  ", "郑\u{123}", "王\t", "冯\\"]
        for (key in elements2) {
            @Expect(treeset.contains(key),false)
        }

        let elements11 = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨",
            "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        @Expect(treeset.contains(all: elements11),true)

        let elements22 = ["赵 ", "钱\b", "孙\n", "李\0", "周`", "吴  ", "郑\u{123}", "王\t", "冯\\"]
        @Expect(treeset.contains(all: elements22),false)

        let elements33 = ["陈", "褚", "卫shi", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张"]
        @Expect(treeset.contains(all: elements33),false)
    }

    @TestCase
    func addAndaddAll(): Unit {
        let treeset = TreeSet<String>()
        @Expect(treeset.size, 0)
        for (e in elementsNames) {
            treeset.add(e)
        }
        @Expect(treeset.size, 24)
        let strNames1: String = "[何, 冯, 卫, 吕, 吴, 周, 孙, 尤, 张, 施, 朱, 李, 杨, 沈, 王, 秦, 蒋, 褚, 许, 赵, 郑, 钱, 陈, 韩]"
        @Expect(treeset.toString(), strNames1)

        let elements1 = ["赵", "吴", "褚", "杨", "尤", "吕", "a", "b"]

        treeset.add(all: elements1)
        @Expect(treeset.size, 26)

        @Assert(treeset.add("测试"))

        let strNames2: String = "[a, b, 何, 冯, 卫, 吕, 吴, 周, 孙, 尤, 张, 施, 朱, 李, 杨, 沈, 测试, 王, 秦, 蒋, 褚, 许, 赵, 郑, 钱, 陈, 韩]"
        @Expect(treeset.toString(), strNames2)
    }

    @TestCase
    func removeAndAllAndRemoveIfAndClear(): Unit {
        var set: TreeSet<Int64> = TreeSet<Int64>(10, {x => x * x})
        @Expect(set.remove(0), true)
        @Expect(set.remove(0), false)
        @Expect(set.remove(10), false)

        set.remove(all: [-2, 0, 1, 8])
        @Expect(set.contains(1), false)
        @Expect(set.contains(8), false)

        set.removeIf({key => (key % 2 == 0)})
        @Expect(set.size, 4)
        @Expect(set.first.getOrThrow(), 9)
        set.removeFirst()
        @Expect(set.first.getOrThrow(), 25)
        set.removeFirst()
        @Expect(set.first.getOrThrow(), 49)
        set.removeFirst()
        @Expect(set.first.getOrThrow(), 81)

        set.clear()
        @Expect(set.size, 0)

        let treeset = TreeSet<String>(elementsRemove)
        let resStrRemove1: String = "[!, #, %, &, (), (●'◡'●), *, 1, 2, 3, 4, 5, 6, 7, 9, :, ;, <, >, @, B, D, F, G, H, K, M, O, Q, S, U, W, Y, ^, a, c, e, g, i, l, n, p, r, t, v, x, z, £, ¤, ¥, ′, ℃, ←, ↑, ↓, ↔, ↖, ↗, ↙, ⇠, ❤, ㎜, ㏄, ㏎, 严, 乐, 于, 云, 任, 何, 俞, 倪, 傅, 冯, 凤, 华, 卫, 史, 吕, 吴, 周, 唐, 喻, 奚, 姜, 孔, 孙, 安, 尤, 岑, 常, 廉, 张, 彭, 戚, 方, 施, 时, 昌, 曹, 朱, 李, 杨, 柏, 柳, 殷, 毕, 水, 汤, 沈, 滕, 潘, 王, 秦, 窦, 章, 罗, 花, 苏, 苗, 范, 葛, 蒋, 薛, 袁, 褚, 许, 谢, 费, 贺, 赵, 邬, 邹, 郎, 郑, 郝, 酆, 金, 钱, 陈, 陶, 雷, 韦, 韩, 马, 魏, 鲁, 鲍, 💙, 💚, 💛, 💜, 🖤, 😂, 😃, 😊, 😢, 🤎, 🤣, 🧡]"
        @Expect(treeset.toString(), resStrRemove1)

        var size = elementsRemove.size
        @Expect(treeset.size, size)

        let results = ["孙", "3", ":", "❤", "魏", "😂"]
        for (result in results) {
            @Expect(treeset.remove(result), true)
            size--
            @Expect(treeset.size, size)
        }
        @Assert(treeset.remove("None"), false)

        treeset.removeIf({k => k <= "a"})
        @Expect(treeset.size, elementsRemove.size - 39)
        treeset.removeIf({k => (k >= "吴" && k <= "曹")})
        @Expect(treeset.size, elementsRemove.size - 59)

        let elements1 = ["c", "e", "g", "i", "l", "n", "p", "r", "t", "v", "x", "z", "£", "¤", "¥", "′", "℃", "←", "↑",
            "↓", "↔", "↖", "↗", "↙", "⇠", "㎜", "㏄", "㏎"]
        treeset.remove(all: elements1)
        @Expect(treeset.size, elementsRemove.size - 87)

        let elements2 = ArrayList<String>()
        for (e in elementsRemove) {
            elements2.add(e)
        }
        treeset.remove(all: elements2)
        @Expect(treeset.isEmpty())

        treeset.add("a")
        treeset.removeIf({k => (k == "a")})
        @Expect(treeset.size, 0)

        treeset.add(all: elementsRemove)
        treeset.removeIf({k => (k >= "张" && k <= "鲍")})
        let resStrRemove3: String = "[!, #, %, &, (), (●'◡'●), *, 1, 2, 3, 4, 5, 6, 7, 9, :, ;, <, >, @, B, D, F, G, H, K, M, O, Q, S, U, W, Y, ^, a, c, e, g, i, l, n, p, r, t, v, x, z, £, ¤, ¥, ′, ℃, ←, ↑, ↓, ↔, ↖, ↗, ↙, ⇠, ❤, ㎜, ㏄, ㏎, 严, 乐, 于, 云, 任, 何, 俞, 倪, 傅, 冯, 凤, 华, 卫, 史, 吕, 吴, 周, 唐, 喻, 奚, 姜, 孔, 孙, 安, 尤, 岑, 常, 廉, 💙, 💚, 💛, 💜, 🖤, 😂, 😃, 😊, 😢, 🤎, 🤣, 🧡]"
        @Expect(treeset.toString(), resStrRemove3)

        treeset.removeIf({k => (k >= "!" && k <= ":")})
        treeset.removeIf({k => (k >= "严" && k <= "廉")})
        let resStrRemove4: String = "[;, <, >, @, B, D, F, G, H, K, M, O, Q, S, U, W, Y, ^, a, c, e, g, i, l, n, p, r, t, v, x, z, £, ¤, ¥, ′, ℃, ←, ↑, ↓, ↔, ↖, ↗, ↙, ⇠, ❤, ㎜, ㏄, ㏎, 💙, 💚, 💛, 💜, 🖤, 😂, 😃, 😊, 😢, 🤎, 🤣, 🧡]"
        @Expect(treeset.toString(), resStrRemove4)
    }

    @TestCase
    func clone(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.clone().isEmpty())
        var set2: TreeSet<Int64> = TreeSet<Int64>(10, {x: Int64 => x * x})
        var set22 = set2.clone()
        @Expect(!set22.isEmpty())
        @Expect(set22.size, 10)
    }

    @TestCase
    func iterator(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        try {
            set1.iterator().next().getOrThrow()
            @Expect("Should throw exception", "set1.iterator().next().getOrThrow()")
        } catch (e: Exception) {
            @Expect(e.message, "")
        }

        var set2: TreeSet<Int64> = TreeSet<Int64>(10, {x: Int64 => x * x})
        var iter2 = set2.iterator()
        var keyValue2 = iter2.next().getOrThrow()
        @Expect(keyValue2, 0)

        let treeset = TreeSet<String>(elementsNames)
        let iter3 = treeset.iterator()
        for (k in iter3) {
            @Expect(treeset.contains(k))
        }

        treeset.removeFirst()
        @Expect(treeset.size, 23)

        try {
            iter3.next()
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }
    }

    @TestCase
    func backwardAndForward(): Unit {
        let treeset = TreeSet<Int64>(5, {x: Int64 => 2 * x})
        // Exist Key
        @Expect(treeset.forward(2, inclusive: true) |> collectHashSet, HashSet<Int64>(4, {x: Int64 => 2*(x+1)}))
        @Expect(treeset.forward(2, inclusive: false) |> collectHashSet, HashSet<Int64>(3, {x: Int64 => 2*(x+2)}))

        @Expect(treeset.backward(2, inclusive: true) |> collectHashSet, HashSet<Int64>([0,2]))
        @Expect(treeset.backward(2, inclusive: false) |> collectHashSet, HashSet<Int64>([0]))

        @Expect(treeset.forward(0, inclusive: true) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))
        @Expect(treeset.forward(0, inclusive: false) |> collectHashSet, HashSet<Int64>(2,4,6,8))

        @Expect(treeset.backward(8, inclusive: true) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))
        @Expect(treeset.backward(8, inclusive: false) |> collectHashSet, HashSet<Int64>(0,2,4,6))

        // Not exist key
        @Expect(treeset.backward(10, inclusive: true) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))
        @Expect(treeset.backward(10, inclusive: false) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))

        @Expect(treeset.forward(-10, inclusive: true) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))
        @Expect(treeset.forward(-10, inclusive: false) |> collectHashSet, HashSet<Int64>(5, {x: Int64 => 2*x}))

        @Expect(treeset.backward(3, inclusive: true) |> collectHashSet, HashSet<Int64>(0,2))
        @Expect(treeset.backward(3, inclusive: false) |> collectHashSet, HashSet<Int64>(0,2))

        @Expect(treeset.forward(3, inclusive: true) |> collectHashSet, HashSet<Int64>(4,6,8))
        @Expect(treeset.forward(3, inclusive: false) |> collectHashSet, HashSet<Int64>(4,6,8))

        @Expect(treeset.forward(10, inclusive: true) |> collectHashSet, HashSet<Int64>())
        @Expect(treeset.forward(10, inclusive: false) |> collectHashSet, HashSet<Int64>())

        @Expect(treeset.backward(-11, inclusive: true) |> collectHashSet, HashSet<Int64>())
        @Expect(treeset.backward(-11, inclusive: false) |> collectHashSet, HashSet<Int64>())
    }

    @TestCase
    func removeIfException(): Unit {
        let set1: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9])
        try {
            set1.removeIf(
                {
                    key: Int64 =>
                    set1.remove(key)
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            set1.removeIf(
                {
                    _: Int64 =>
                    set1.removeLast()
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            set1.removeIf(
                {
                    _: Int64 =>
                    set1.removeFirst()
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        let set2: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9])
        try {
            set2.removeIf(
                {
                    key: Int64 =>
                    set2.remove(key)
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
        let set: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9])
        try {
            set.removeIf(
                {
                    _: Int64 =>
                    set.clear()
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
        let set: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9])
        try {
            set.removeIf(
                {
                    _: Int64 =>
                    set.add(10)
                    return false
                }
            )
            @Expect("Should throw exception", "")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            set.removeIf(
                {
                    _: Int64 =>
                    set.add(all: [11, 12])
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
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.size, 0)
        @Expect(set1.isEmpty())
        var set2: TreeSet<Int64> = TreeSet<Int64>(10, {x => x * 2 + 1})
        @Expect(set2.size, 10)
        @Expect(!set2.isEmpty())
    }

    @TestCase
    func operatorEqualAndUnequal(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        var set2: TreeSet<Int64> = TreeSet<Int64>()
        var set3: TreeSet<Int64> = TreeSet<Int64>(10, {x: Int64 => x})
        var set4: TreeSet<Int64> = TreeSet<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        @Expect(set1 == set2)
        @Expect(set1 != set2, false)
        @Expect(set3 == set4)
        @Expect(set3 != set4, false)
        @Expect(set1 != set3)
        @Expect(set2 != set4)
    }

    @TestCase
    func subsetOf(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        var set2: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set3: TreeSet<Int64> = TreeSet<Int64>([1, 4])
        var set4: TreeSet<Int64> = TreeSet<Int64>([0, 4, 81])
        var set5: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set6: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 82])
        @Expect(set1.subsetOf(set1))
        @Expect(!set3.subsetOf(set1))
        @Expect(set1.subsetOf(set2))
        @Expect(set2.subsetOf(set2))
        @Expect(set3.subsetOf(set2))
        @Expect(set4.subsetOf(set2))
        @Expect(set5.subsetOf(set2))
        @Expect(!set6.subsetOf(set2))
    }

    @TestCase
    func retainAll(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        try {
            set1.retain(all: TreeSet<Int64>([1, 2]))
            @Expect(set1.isEmpty())
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set2.retain(all: TreeSet<Int64>([-1, 2]))
            @Expect(set2.isEmpty())
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set3: TreeSet<Int64> = TreeSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        set3.retain(all: TreeSet<Int64>([0, 2, 1, 4, 36]))
        @Expect(set3, TreeSet<Int64>([0, 1, 4, 36]))
        set3.retain(all: TreeSet<Int64>([0, 1, 4, 36]))
        @Expect(set3, TreeSet<Int64>([0, 1, 4, 36]))
        set3.retain(all: TreeSet<Int64>([9, 16]))
        @Expect(set3.isEmpty())
    }

    @TestCase
    func toArray(): Unit {
        var set1: TreeSet<Int64> = TreeSet<Int64>()
        @Expect(set1.toArray(), [])

        var set2: TreeSet<Int64> = TreeSet<Int64>([0, 64, 81, 9, 16, 1, 36, 49, 25, 4])
        @Expect(set2.toArray(), [0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
    }

    @TestCase
    func intersect() {
        let set1: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5])
        let set2: TreeSet<Int64> = TreeSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 & set2
        @Expect(result, TreeSet<Int64>([3, 4, 5]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))

        let set3: TreeSet<Int64> = TreeSet<Int64>([8, 9])
        result = set1 & set3
        @Expect(result, TreeSet<Int64>([]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))
    }

    @TestCase
    func union() {
        let set1: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5])
        let set2: TreeSet<Int64> = TreeSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 | set2
        @Expect(result, TreeSet<Int64>([1, 2, 3, 4, 5, 6, 7]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))

        let set3: TreeSet<Int64> = TreeSet<Int64>([8, 9])
        result = set1 | set3
        @Expect(result, TreeSet<Int64>([1, 2, 3, 4, 5, 8, 9]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))
    }

    @TestCase
    func different() {
        let set1: TreeSet<Int64> = TreeSet<Int64>([1, 2, 3, 4, 5])
        let set2: TreeSet<Int64> = TreeSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 - set2
        @Expect(result, TreeSet<Int64>([1, 2]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))

        let set3: TreeSet<Int64> = TreeSet<Int64>([8, 9])
        result = set1 - set3
        @Expect(result, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set1, TreeSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, TreeSet<Int64>([3, 4, 5, 6, 7]))
    }
}
