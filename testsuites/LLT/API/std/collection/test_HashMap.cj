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

class Coo <: Boo {
    public var y: Int64
    public init(x: Int64) {
        super(x)
        this.y = x
    }
}

open class Boo <: Hashable & Equatable<Boo> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        return Int64(x)
    }
    public operator func ==(right: Boo): Bool {
        return this.x == right.x
    }
    public operator func !=(right: Boo): Bool {
        return this.x != right.x
    }
}

class CustomizedKey <: Hashable & Equatable<CustomizedKey> {
    public var m_data: Int64

    public init(m_data: Int64) {
        this.m_data = m_data
    }

    public func UpdateKey(data: Int64): Unit {
        this.m_data += data
    }

    public func hashCode(): Int64 {
        return this.m_data
    }

    public operator func ==(right: CustomizedKey): Bool {
        return (this.m_data == right.m_data)
    }

    public operator func !=(right: CustomizedKey): Bool {
        return (this.m_data != right.m_data)
    }
}

@Test
class HashMapTest {
    @TestCase
    func initWithoutParameter(): Unit {
        var map1: HashMap<String, String> = HashMap<String, String>()
        @Expect(map1.size, 0)
        @Expect(map1.capacity, 16)

        var map2: HashMap<String, Int64> = HashMap<String, Int64>()
        @Expect(map2.size, 0)
        @Expect(map2.capacity, 16)

        var map3: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        @Expect(map3.size, 0)
        @Expect(map3.capacity, 16)
    }

    @TestCase
    func initByCollection(): Unit {
        var col: Collection<(Int64, Int64)> = [(1, 2), (2, 3), (3, 4)]
        var map: HashMap<Int64, Int64> = HashMap<Int64, Int64>(col)
        var res: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(1, 2), (2, 3), (3, 4)])
        @Expect(map.size, 3)
        @Expect(map.capacity, 3)
        @Expect(map, res)
    }

    @TestCase
    func initByArray(): Unit {
        var arr: Array<(Int64, Int64)> = [(3, 4), (2, 3), (1, 2)]
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>(arr)
        var res: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(1, 2), (2, 3), (3, 4)])
        @Expect(map1.size, 3)
        @Expect(map1.capacity, 3)
        @Expect(map1, res)
        var map2: HashMap<String, String> = HashMap<String, String>(
            [("49", "1"), ("58", "2"), ("67", "3"), ("76", "4"), ("85", "5"), ("94", "6"), ("139", "7"), ("148", "8"),
                ("157", "9"), ("aa", "1"), ("ab", "2"), ("ac", "3"), ("ad", "4"), ("ae", "5"), ("af", "6"), ("ag", "7"),
                ("ah", "8"), ("ai", "9"), ("aj", "1"), ("ak", "2"), ("al", "3"), ("am", "4"), ("an", "5"), ("ao", "6"),
                ("ap", "7"), ("aq", "8"), ("ar", "9"), ("as", "1"), ("at", "2"), ("au", "3"), ("av", "4"), ("aw", "5"),
                ("ax", "6"), ("ay", "7"), ("az", "8"), ("aA", "9"), ("aB", "1"), ("aC", "2"), ("aD", "3"), ("aE", "4"),
                ("aF", "5"), ("aG", "6"), ("aH", "7"), ("aI", "8"), ("aJ", "9"), ("aK", "1"), ("aL", "2"), ("aM", "3"),
                ("aN", "4"), ("aO", "5"), ("aP", "6"), ("aQ", "7"), ("aR", "8"), ("aS", "9"), ("aT", "1"), ("aU", "2"),
                ("aV", "3"), ("aW", "4"), ("aX", "5"), ("aY", "6"), ("aZ", "7"), ("AA", "8"), ("AB", "9"), ("AC", "1"),
                ("AD", "2"), ("AE", "3"), ("AF", "4"), ("AJ", "5"), ("AH", "6"), ("AI", "7"), ("AJ", "8"), ("AK", "9"),
                ("AL", "1"), ("AM", "2"), ("AN", "3"), ("AO", "4"), ("AP", "5"), ("AQ", "6"), ("AR", "7"), ("AS", "8"),
                ("AT", "9")])
        @Expect(map2.size, 80)
    }

    @TestCase
    func initByCapacity(): Unit {
        var map: HashMap<Int64, Int64> = HashMap<Int64, Int64>(10)
        @Expect(map.size, 0)
        @Expect(map.capacity, 10)

        try {
            var _ = HashMap<Int64, Int64>(-10)
            @Expect("Should throw exception", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid size of HashMap: -10.")
        }
        try {
            var _ = HashMap<String, Int64>(-3)
            @Expect("Should throw exception", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid size of HashMap: -3.")
        }
    }

    @TestCase
    func initByFunction(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>(10, {x: Int64 => (x, x * x)})
        var res: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map1.size, 10)
        @Expect(map1.capacity, 10)
        @Expect(map1, res)

        var map2: HashMap<Int8, String> = HashMap<Int8, String>(100, {x: Int64 => (Int8(x), x.toString())})
        @Expect(map2.size, 100 )

        try {
            var _ = HashMap<Int64, Int64>(-10, {K => (K, K)})
            @Expect("Should throw exception", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid size of HashMap: -10.")
        }
    }

    @TestCase
    func contains(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        @Expect(!map1.contains(1))

        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(1, 2), (2, 3), (3, 4)])
        @Expect(map2.contains(1))
        @Expect(map2.contains(2))
        @Expect(map2.contains(3))
        @Expect(!map2.contains(5))
    }

    @TestCase
    func containsAll(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var col1: Collection<Int64> = Array<Int64>()
        var col2: Collection<Int64> = [0, 1]
        @Expect(map1.contains(all: col1))
        @Expect(!map1.contains(all: col2))

        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        var col3: Collection<Int64> = [0, 5, 3, 9]
        var col4: Collection<Int64> = [-1]
        var col5: Collection<Int64> = [2, 10]
        @Expect(map2.contains(all: col1))
        @Expect(map2.contains(all: col2))
        @Expect(map2.contains(all: col3))
        @Expect(!map2.contains(all: col4))
        @Expect(!map2.contains(all: col5))
    }

    @TestCase
    func get(): Unit {
        var map1: HashMap<Int64, String> = HashMap<Int64, String>()
        @Expect(map1.get(0), Option<String>.None)

        var map2: HashMap<Int64, String> = HashMap<Int64, String>([(1, "1"), (8, "8"), (3, "3")])
        @Expect(map2.get(0), Option<String>.None)
        @Expect(map2.get(1), "1")
        @Expect(map2.get(3), "3")
        @Expect(map2.get(8), "8")
    }

    @TestCase
    func entryView(): Unit {
        var map1: HashMap<Int64, String> = HashMap<Int64, String>()
        @Expect(map1.entryView(0).value.isNone())

        var map2: HashMap<Int64, String> = HashMap<Int64, String>([(1, "1"), (8, "8"), (3, "3")])
        var view2_0: MapEntryView<Int64, String> = map2.entryView(0)
        @Expect(view2_0.value.isNone())
        var view2_3_1: MapEntryView<Int64, String> = map2.entryView(3)
        @Expect(!view2_3_1.value.isNone())
        @Expect(view2_3_1.key, 3)
        @Expect(view2_3_1.value, Some("3"))

        view2_3_1.value = "33"
        var view2_3_2: MapEntryView<Int64, String> = map2.entryView(3)
        @Expect(!view2_3_2.value.isNone())
        @Expect(view2_3_2.key, 3)
        @Expect(view2_3_2.value, Some("33"))
    }

    @TestCase
    func operatorGet(): Unit {
        var map1: HashMap<Int64, String> = HashMap<Int64, String>()
        try {
            var _: String = map1[0]
            @Expect("Should throw exception", "")
        } catch (e: NoneValueException) {
            @Expect(e.message, "Value does not exist!\n")
        }

        var map2: HashMap<Int64, String> = HashMap<Int64, String>([(1, "1"), (8, "8"), (3, "3")])
        try {
            var _: String = map2[0]
            @Expect("Should throw exception", "")
        } catch (e: NoneValueException) {
            @Expect(e.message, "Value does not exist!\n")
        }
        @Expect(map2[1], "1")
        @Expect(map2[3], "3")
        @Expect(map2[8], "8")
    }

    @TestCase
    func add(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>()
        @Expect(map.add(1, "1"), Option<String>.None)
        @Expect(map.add(1, "1"), "1")
        @Expect(map.add(1, "11"), "1")
        @Expect(map.add(1, "1"), "11")
        @Expect(map.add(8, "8"), Option<String>.None)
        @Expect(map.add(3, "3"), Option<String>.None)

        @Expect(map.size, 3)
        @Expect(map.get(1), "1")
        @Expect(map.get(3), "3")
        @Expect(map.get(8), "8")
    }

    @TestCase
    func addIfAbsent(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>()
        @Expect(map.addIfAbsent(1, "1"), None)
        @Expect(map.addIfAbsent(1, "1"), Some("1"))
        @Expect(map.addIfAbsent(1, "11"), Some("1"))
        @Expect(map.addIfAbsent(1, "1"), Some("1"))
        @Expect(map.addIfAbsent(8, "8"), None)
        @Expect(map.addIfAbsent(3, "3"), None)

        @Expect(map.size, 3)
        @Expect(map.get(1), "1")
        @Expect(map.get(3), "3")
        @Expect(map.get(8), "8")
    }

    @TestCase
    func addAll(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>()
        map.add(all: [(1, "11"), (3, "3")])
        map.add(all: [(1, "1"), (8, "8")])
        map.add(all: [(1, "11"), (1, "1")])

        @Expect(map.size, 3)
        @Expect(map.get(1), "1")
        @Expect(map.get(3), "3")
        @Expect(map.get(8), "8")
    }

    @TestCase
    func replace(): Unit {
        var map = HashMap<Int64, String>()
        map.add(1, "1")
        @Expect(map.replace(1, "11"), Some("1"))
        @Expect(map.replace(2, "2"), None)
        @Expect(map.get(1), Some("11"))
        @Expect(map.get(2), None)
    }

    @TestCase
    func operatorPut(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>()
        map[1] = "1"
        @Expect(map[1], "1")
        map[1] = "1"
        @Expect(map[1], "1")
        map[1] = "11"
        @Expect(map[1], "11")
        map[1] = "1"
        map[8] = "8"
        map[3] = "3"

        @Expect(map[1], "1")
        @Expect(map[3], "3")
        @Expect(map[8], "8")
    }

    @TestCase
    func remove(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>([(1, "1"), (8, "8"), (3, "3")])
        @Expect(map.remove(0), Option<String>.None)
        @Expect(map.remove(1), "1")
        @Expect(map.remove(8), "8")
        @Expect(map.size, 1)
        @Expect(map[3], "3")
    }

    @TestCase
    func removeAll(): Unit {
        var map: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        var col: Collection<Int64> = [0, 1, 8, 3, 4, 5, 6, 10, 1000]
        map.remove(all: col)
        @Expect(map.size, 3)
        @Expect(map[2], 4)
        @Expect(map[7], 49)
        @Expect(map[9], 81)
    }

    @TestCase
    func removeIf(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        map1.removeIf({key: Int64, value: Int64 => (key % 2 == 0 || value % 2 == 0)})
        @Expect(map1.size, 5)
        @Expect(map1[1], 1)
        @Expect(map1[3], 9)
        @Expect(map1[5], 25)
        @Expect(map1[7], 49)
        @Expect(map1[9], 81)

        map1.removeIf({_, _ => false})
        @Expect(map1.size, 5)

        map1.removeIf({_, _ => true})
        @Expect(map1.size, 0)

        let map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        try {
            map2.removeIf(
                {
                    key: Int64, _: Int64 =>
                    map2.remove(key)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            map2.removeIf(
                {
                    key: Int64, _: Int64 =>
                    map2.remove(key)
                    return false
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }

    @TestCase
    func clear(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>([(1, "1"), (8, "8"), (3, "3")])
        map.clear()
        @Expect(map.size, 0)
    }

    @TestCase
    func reserve1(): Unit {
        var map: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map.size, 10)
        @Expect(map.capacity, 10)
        map.reserve(-1)
        @Expect(map.size, 10)
        @Expect(map.capacity, 10)
        map.reserve(0)
        @Expect(map.size, 10)
        @Expect(map.capacity, 10)
        map.reserve(6)
        @Expect(map.size, 10)
        @Expect(map.capacity, 16)
        map.reserve(8)
        @Expect(map.size, 10)
        @Expect(map.capacity, 24)
    }

    @TestCase
    func reserve2(): Unit {
        let arr = [521, 407, 213, 357, 554, 852, 935, 196, 350, 881, 118, 925, 820, 997, 37, 572, 989, 115, 215, 61, 922,
            751, 183, 920, 729, 775, 94, 454, 40, 868, 501, 145, 733, 583, 940, 862, 236, 530, 608, 336, 645, 259, 110,
            11, 339, 80, 176, 865, 369, 162, 415, 274, 822, 837, 793, 955, 194, 867, 14, 48, 740, 249, 592, 732, 366,
            663, 104, 651, 918, 903, 551, 250, 713, 957, 434, 705, 238, 519, 764, 412, 329, 772, 363, 631, 756, 47, 92,
            354, 297, 393, 525, 240, 543, 695, 810, 958, 66, 253, 899, 847, 134, 977, 895, 930, 831, 133, 277, 29, 894,
            478, 947, 803, 537, 258, 338, 157, 424, 333, 237, 290, 553, 349, 262, 438, 149, 726, 181, 234, 128, 742, 956,
            527, 331, 850, 601, 861, 23, 38, 246, 624, 322, 95, 509, 593, 82, 281, 461, 627, 979, 140, 934, 46, 697, 189,
            739, 34, 797, 980, 67, 400, 390, 184, 749, 987, 816, 786, 969, 507, 504, 558, 197, 653, 815, 168, 135, 43,
            15, 848, 286, 702, 693, 365, 804, 906, 479, 802, 886, 114, 559, 152, 643, 447, 568, 148, 885, 674, 22, 167,
            163, 472, 126, 911, 655, 376, 426, 924, 747, 550, 8, 676, 760, 913, 378, 443, 580, 474, 591, 121, 633, 91,
            759, 574, 151, 524, 658, 545, 565, 33, 929, 828, 113, 265, 230, 926, 876, 24, 125, 358, 68, 136, 127, 411,
            373, 153, 195, 347, 103, 3, 199, 319, 836, 107, 7, 715, 971, 173, 117, 784, 56, 834, 829, 642, 919, 288, 323,
            90, 470, 459, 441, 267, 738, 492, 531, 326, 332, 270, 404, 102, 777, 54, 953, 305, 547, 938, 701, 60, 387,
            549, 203, 711, 433, 160, 898, 496, 563, 699, 16, 723, 907, 458, 844, 122, 870, 893, 124, 734, 289, 909, 485,
            685, 666, 334, 813, 714, 310, 511, 632, 491, 285, 275, 982, 888, 78, 630, 535, 571, 706, 360, 440, 264, 224,
            927, 576, 244, 9, 596, 616, 983, 819, 686, 313, 71, 520, 514, 641, 280, 683, 428, 228, 901, 799, 675, 975,
            776, 915, 882, 1, 800, 175, 564, 891, 854, 99, 762, 603, 268, 307, 208, 517, 380, 39, 131, 745, 109, 954,
            731, 807, 471, 516, 838, 728, 951, 587, 93, 304, 746, 636, 320, 383, 752, 352, 291, 883, 767, 908, 634, 590,
            963, 484, 708, 256, 292, 233, 422, 88, 754, 55, 266, 389, 589, 301, 170, 137, 532, 405, 680, 106, 475, 763,
            321, 575, 561, 840, 889, 618, 205, 757, 456, 652, 811, 448, 96, 273, 51, 138, 874, 945, 421, 665, 111, 101,
            725, 255, 505, 17, 942, 306, 344, 65, 483, 677, 855, 252, 856, 356, 190, 177, 32, 964, 890, 178, 529, 879,
            892, 682, 539, 931, 916, 950, 620, 417, 717, 597, 866, 164, 910, 442, 933, 792, 191, 835, 388, 512, 232, 718,
            604, 382, 991, 464, 4, 392, 871, 294, 615, 671, 662, 805, 541, 254, 598, 239, 327, 371, 100, 72, 351, 602,
            495, 730, 293, 978, 873, 928, 617, 279, 5, 741, 132, 506, 557, 272, 64, 994, 743, 342, 348, 995, 49, 996,
            161, 649, 13, 690, 612, 567, 787, 842, 654, 312, 735, 755, 242, 58, 966, 453, 420, 50, 418, 902, 544, 436,
            681, 225, 77, 87, 932, 220, 469, 362, 355, 710, 970, 158, 402, 782, 486, 317, 112, 993, 832, 423, 937, 687,
            159, 316, 698, 684, 201, 960, 669, 123, 748, 309, 650, 638, 540, 724, 86, 914, 182, 586, 949, 419, 372, 585,
            300, 788, 20, 827, 381, 720, 399, 579, 345, 750, 450, 985, 877, 581, 35, 353, 361, 518, 783, 660, 314, 74,
            851, 42, 864, 513, 912, 716, 533, 209, 707, 637, 295, 169, 427, 143, 214, 999, 36, 341, 211, 613, 785, 737,
            806, 231, 31, 939, 611, 696, 53, 965, 727, 884, 468, 769, 84, 528, 325, 673, 397, 555, 897, 768, 261, 569,
            85, 841, 896, 467, 502, 526, 186, 849, 988, 857, 900, 781, 410, 670, 245, 302, 44, 515, 584, 386, 974, 263,
            147, 379, 446, 396, 659, 823, 59, 499, 923, 765, 185, 391, 546, 318, 594, 941, 880, 647, 976, 375, 981, 858,
            628, 437, 639, 609, 311, 818, 595, 57, 626, 694, 89, 961, 432, 204, 248, 212, 825, 41, 497, 625, 166, 812,
            691, 692, 846, 431, 789, 416, 824, 795, 503, 952, 62, 130, 944, 384, 644, 998, 52, 207, 808, 562, 508, 809,
            548, 600, 439, 534, 28, 27, 210, 779, 198, 76, 656, 398, 863, 45, 679, 959, 142, 623, 605, 165, 668, 773,
            343, 271, 629, 395, 359, 700, 120, 794, 887, 335, 607, 403, 578, 462, 81, 10, 494, 374, 155, 139, 414, 455,
            406, 73, 251, 430, 972, 487, 385, 482, 435, 946, 635, 243, 276, 303, 25, 573, 556, 105, 801, 227, 523, 108,
            619, 875, 704, 337, 206, 156, 368, 833, 144, 744, 992, 790, 409, 30, 560, 614, 672, 465, 766, 19, 69, 63,
            278, 154, 12, 500, 282, 678, 70, 463, 287, 425, 814, 187, 129, 247, 2, 180, 218, 473, 488, 364, 216, 973,
            943, 599, 330, 449, 466, 588, 921, 141, 703, 610, 722, 480, 498, 904, 202, 18, 872, 719, 606, 566, 721, 948,
            664, 401, 222, 990, 839, 193, 296, 736, 753, 6, 542, 284, 457, 476, 298, 452, 269, 552, 324, 536, 172, 192,
            260, 241, 621, 377, 905, 408, 986, 179, 26, 413, 917, 477, 661, 340, 229, 429, 821, 859, 770, 843, 936, 582,
            758, 878, 796, 116, 445, 817, 217, 394, 98, 188, 689, 21, 826, 444, 489, 667, 328, 150, 171, 761, 146, 308,
            771, 780, 798, 853, 688, 830, 493, 968, 778, 283, 657, 75, 577, 221, 174, 640, 346, 370, 709, 451, 774, 984,
            235, 860, 522, 570, 869, 712, 646, 967, 367, 226, 119, 257, 510, 299, 791, 223, 315, 219, 481, 460, 538, 83,
            200, 962, 622, 845, 79, 97, 490, 648]
        let map = HashMap<Int64, Int64>()
        for (i in 0..arr.size) {
            map.add(arr[i], i)
        }
        for (i in 0..arr.size) {
            @Expect(map[arr[i]], i)
        }
    }

    @TestCase
    func reserve3(): Unit {
        let map = HashMap<String, Int64>()
        map.add("876", 2);
        map.add("879", 2);
        map.add("155", 2);
        map.add("291", 2);
        map.add("431", 2);
        map.add("296", 2);
        map.add("592", 2);
        map.add("965", 2);
        map.add("502", 2);
        map.add("173", 2);
        map.add("869", 2);
        map.add("504", 2);
        map.add("258", 2);
        map.add("342", 2);
        map.add("192", 2);
        map.add("478", 2);
        map.add("270", 2);
        map.add("341", 2);
        map.add("811", 2);
        map.add("794", 2);
        map.add("472", 2);
        map.add("625", 2);
        map.add("229", 2);
        map.add("829", 2);
        map.add("122", 2);
        map.add("858", 2);
        map.add("738", 2);
        map.add("481", 2);
        map.add("102", 2);
        map.add("946", 2);
        map.add("305", 2);
        map.add("399", 2);
        map.add("216", 2);
        map.add("752", 2);
        map.add("413", 2);
        map.add("352", 2);
        map.add("271", 2);
        map.add("193", 2);
        map.add("534", 2);
        map.add("508", 2);
        map.add("152", 2);
        map.add("989", 2);
        map.add("154", 2);
        map.add("456", 2);
        map.add("168", 2);
        map.add("510", 2);
        map.add("391", 2);
        map.add("28", 2);
        map.add("317", 2);
        map.add("409", 2);
        map.add("609", 2);
        map.add("532", 2);
        map.add("784", 2);
        map.add("160", 2);
        map.add("696", 2);
        map.add("105", 2);
        map.add("245", 2);
        map.add("231", 2);
        map.add("20", 2);
        map.add("17", 2);
        map.add("81", 2);
        map.add("781", 2);
        map.add("79", 2);
        map.add("816", 2);
        map.add("918", 2);
        map.add("838", 2);
        map.add("123", 2);
        map.add("602", 2);
        map.add("338", 2);
        map.add("997", 2);
        map.add("192", 2);
        map.add("947", 2);
        map.add("388", 2);
        map.add("515", 2);
        map.add("510", 2);
        map.add("441", 2);
        map.add("175", 2);
        map.add("539", 2);
        map.add("708", 2);
        map.add("980", 2);
        map.add("207", 2);
        map.add("336", 2);
        map.add("524", 2);
        map.add("610", 2);
        map.add("3", 2);
        map.add("427", 2);
        map.add("282", 2);
        map.add("84", 2);
        map.add("953", 2);
        map.add("855", 2);
        map.add("117", 2);
        map.add("737", 2);
        map.add("288", 2);
        map.add("371", 2);
        map.add("623", 2);
        map.add("484", 2);
        map.add("738", 2);
        map.add("874", 2);
        map.add("426", 2);
        map.add("202", 2);
        map.add("481", 2);
        map.add("132", 2);
        map.add("499", 2);
        map.add("500", 2);
        map.add("89", 2);
        map.add("786", 2);
        map.add("276", 2);
        map.add("221", 2);
        map.add("857", 2);
        map.add("398", 2);
        map.add("242", 2);
        map.add("639", 2);
        map.add("771", 2);
        map.add("149", 2);
        map.add("758", 2);
        map.add("775", 2);
        map.add("39", 2);
        map.add("836", 2);
        map.add("70", 2);
        map.add("903", 2);
        map.add("193", 2);
        map.add("959", 2);
        map.add("169", 2);
        map.add("851", 2);
        map.add("798", 2);
        map.add("815", 2);
        map.add("755", 2);
        map.add("498", 2);
        map.add("308", 2);
        map.add("70", 2);
        map.add("217", 2);
        map.add("765", 2);
        map.add("504", 2);
        map.add("498", 2);
        map.add("56", 2);
        map.add("547", 2);
        map.add("578", 2);
        map.add("977", 2);
        map.add("882", 2);
        map.add("909", 2);
        map.add("9", 2);
        map.add("874", 2);
        map.add("223", 2);
        map.add("39", 2);
        map.add("429", 2);
        map.add("982", 2);
        map.add("129", 2);
        map.add("712", 2);
        map.add("77", 2);
        map.add("996", 2);
        map.add("43", 2);
        map.add("613", 2);
        map.add("800", 2);
        map.add("810", 2);
        map.add("73", 2);
        map.add("993", 2);
        map.add("763", 2);
        map.add("978", 2);
        map.add("912", 2);
        map.add("255", 2);
        map.add("468", 2);
        map.add("937", 2);
        map.add("987", 2);
        map.add("701", 2);
        map.add("155", 2);
        map.add("347", 2);
        map.add("980", 2);
        map.add("147", 2);
        map.add("698", 2);
        map.add("41", 2);
        map.add("353", 2);
        map.add("178", 2);
        map.add("396", 2);
        map.add("241", 2);
        map.add("71", 2);
        map.add("482", 2);
        map.add("40", 2);
        map.add("593", 2);
        map.add("993", 2);
        map.add("959", 2);
        map.add("193", 2);
        map.add("544", 2);
        map.add("376", 2);
        map.add("752", 2);
        map.add("804", 2);
        map.add("194", 2);
        map.add("800", 2);
        map.add("837", 2);
        map.add("673", 2);
        map.add("261", 2);
        map.add("348", 2);
        map.add("963", 2);
        map.add("918", 2);
        map.add("217", 2);
        map.add("945", 2);
        map.add("271", 2);
        map.add("493", 2);
        map.add("538", 2);
        map.add("203", 2);
        map.add("54", 2);
        map.add("850", 2);
        map.add("753", 2);
        map.add("954", 2);
        map.add("312", 2);
        @Expect(map.get("305").getOrThrow(), 2)
    }

    @TestCase
    func sizeIsEmptyCapacity(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        @Expect(map1.size, 0)
        @Expect(map1.isEmpty())
        @Expect(map1.capacity, 16)

        map1[1] = 1
        map1[2] = 22
        @Expect(map1.size, 2)
        @Expect(!map1.isEmpty())
        @Expect(map1.capacity, 16)

        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map2.size, 10)
        @Expect(!map2.isEmpty())
        @Expect(map2.capacity, 10)

        map2.removeIf({key: Int64, value: Int64 => (key % 2 == 0 || value % 2 == 0)})
        @Expect(map2.size, 5)
        @Expect(!map2.isEmpty())
        @Expect(map2.capacity, 10)
    }

    @TestCase
    func operatorOfEqual(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        @Expect(map1 == map2)

        map1[1] = 1
        map1[8] = 8
        @Expect(map1 != map2)

        map2[8] = 88
        map2[1] = 1
        @Expect(map1 != map2)

        map2[8] = 8
        @Expect(map1 == map2)
    }

    @TestCase
    func clone(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        @Expect(map1.clone(), map1)
        @Expect(map2.clone(), map2)
    }

    @TestCase
    func keysAndValues(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        @Expect(map1.keys().size, 0)
        @Expect(map1.values().size, 0)

        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25), (6, 36), (7, 49), (8, 64), (9, 81)])
        var keys2: Array<Int64> = map2.keys().toArray()
        var value2: Array<Int64> = map2.values().toArray()
        @Expect(keys2.size, map2.size)
        @Expect(value2.size, map2.size)
        for (i in 0..10) {
            @Expect(map2[keys2[i]], value2[i])
        }
    }
    @TestCase
    func iterator(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var iter1 = map1.iterator()
        var pair1 = iter1.next()
        var matchTuple = {
            tuple: Option<(Int64, Int64)> => match (tuple) {
                case Some(tuple) => tuple
                case None => (-1, -1)
            }
        }
        var realPair1 = matchTuple(pair1)
        @Expect(realPair1[0], -1)
        @Expect(realPair1[1], -1)

        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(10, {K => (K, K * K)})
        var iter2 = map2.iterator()
        var pair2 = iter2.next()
        var realPair2 = matchTuple(pair2)
        @Expect(realPair2[0], 0)
        @Expect(realPair2[1], 0)
        map2.remove(3)
        try {
            iter2.next()
            @Expect("Should throw exception", "iter2.next()")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }

        var iter3 = map2.iterator()
        iter3.next()
        var pair3 = iter3.remove()
        var realPair3 = matchTuple(pair3)
        @Expect(realPair3[0], 0)
        @Expect(realPair3[1], 0)
        iter3.next()
        map2.remove(4)
        try {
            iter3.remove()
            @Expect("Should throw exception", "iter3.remove()")
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "")
        }
    }

    @TestCase
    func iteratorNoneRemove(): Unit {
        var map: HashMap<String, Int64> = HashMap<String, Int64>([("a", 8), ("b", 19)])
        var iter = map.iterator()
        println(map)
        @Expect(iter.next().getOrThrow()[1], 8)
        @Expect(iter.next().getOrThrow()[1], 19)
        iter.next()
        iter.remove()
    }

    @TestCase
    func toString(): Unit {
        var map1: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>(
            [(0, 0), (1, 1), (2, 4), (3, 9), (9, 81), (4, 16), (8, 64), (5, 25), (6, 36), (7, 49)])
        @Expect(map1.toString(), "[]")
        @Expect(map2.toString(),
        "[(0, 0), (1, 1), (2, 4), (3, 9), (9, 81), (4, 16), (8, 64), (5, 25), (6, 36), (7, 49)]")
    }

    @TestCase
    func forEach(): Unit {
        var bug: HashMap<String, Float64> = HashMap<String, Float64>(
            [("1", 0.27), ("2", 0.23), ("3", 0.25), ("4", 0.21), ("5", 0.21), ("6", 0.21), ("7", 0.21), ("8", 0.21),
                ("9", 0.21), ("10", 0.21), ("11", 0.21), ("12", 0.21), ("13", 0.21), ("14", 0.21)])
        for (i in bug.keys()) {
            match (i) {
                case "1" => @Assert(bug[i], 0.27)
                case "2" => @Assert(bug[i], 0.23)
                case "3" => @Assert(bug[i], 0.25)
                case _ => @Assert(bug[i], 0.21)
            }
        }
    }

    @TestCase
    func customizedClassKey(): Unit {
        var key1 = Boo(1)
        var key2 = Coo(2)
        var map1: HashMap<Boo, Int64> = HashMap<Boo, Int64>([(key1, 5), (key2, 10)])
        @Expect(map1[key1], 5)
        var value = map1.get(key2)
        match (value) {
            case Some(value) => @Expect(value, 10)
            case None => @Expect("Error value", "")
        }

        var map2: HashMap<CustomizedKey, Int64> = HashMap<CustomizedKey, Int64>()
        var keyPre = CustomizedKey(0)
        map2[keyPre] = 13
        var keyIn = CustomizedKey(0)
        var max: Int64 = 100
        for (_ in 0..max) {
            keyIn.UpdateKey(2)
            try {
                map2[keyIn] = map2[keyIn] + 1
            } catch (e: NoneValueException) {
                var newKey: CustomizedKey = CustomizedKey(keyIn.m_data)
                map2[newKey] = 1
            }
        }
        @Expect(map2.size, 101)
        @Expect(map2[keyIn], 1)
    }

    @TestCase
    func repetitiveKeys(): Unit {
        var map1: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
        var map2: HashMap<Int8, String> = HashMap<Int8, String>([(0, "0"), (1, "1")])
        map1.add(all: map2)
        @Expect(map1.size, 2)
        @Expect(map1[0], "0")
        @Expect(map1[1], "1")

        var map3: HashMap<Int8, String> = HashMap<Int8, String>([(1, "1"), (2, "2"), (1, "3")])
        @Expect(map3.size, 2)
        @Expect(map3[1], "3")
        @Expect(map3[2], "2")
    }

    @TestCase
    func getPutReturnOption(): Unit {
        var map: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
        @Expect(map.add(1,"2").getOrThrow(), "1")
        @Expect(map.get(1).getOrThrow(), "2")
    }

    @TestCase
    func removeAndAllSize(): Unit {
        var map1: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
        var map2 = map1.clone()
        map1.remove(1)
        @Expect(map1.size, 1)
        @Expect(map1[0], "0")

        map2.remove(all: [0])
        @Expect(map2.size, 1)
        @Expect(map2[1], "1")
    }

    @TestCase
    func forIn(): Unit {
        var map1: HashMap<Int8, String> = HashMap<Int8, String>()
        map1.add(1, "xiaoli")
        map1.add(2, "xiaohei")
        var map2: HashMap<Int8, String> = HashMap<Int8, String>(map1)
        for ((k, v) in map2) {
            @Expect(map1[k], v)
        }
    }
}
