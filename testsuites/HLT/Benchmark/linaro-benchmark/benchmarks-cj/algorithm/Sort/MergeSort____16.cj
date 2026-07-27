/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

import std.process.*
import std.time.*
import std.math.*
import std.convert.*
import std.convert.*
import std.collection.*
import std.sort.SortByExtension

class MergeSort____16 {
    public var referenceInputArray: Array<Int64> = [
        2334, 3368, 316, 762, 3183, 3200, 1037, 814, 238, 1882, 3382, 3682, 4034,
        2655, 119, 1820, 1287, 896, 1871, 939, 1478, 3882, 327, 3368, 1764, 3712,
        2363, 2823, 878, 3094, 1961, 3351, 1518, 2658, 2627, 3537, 4096, 1917, 1403,
        183, 61, 1753, 2223, 3080, 2952, 1514, 1291, 1588, 4037, 960, 721, 3470,
        574, 3277, 3068, 3190, 3257, 481, 2698, 2817, 1863, 3671, 2677, 3969, 1403,
        3408, 3829, 2487, 136, 3810, 2247, 1402, 2680, 2255, 1532, 723, 1274, 655,
        2389, 1820, 59, 10, 3981, 3605, 2735, 3959, 1914, 808, 3485, 507, 1345, 545,
        1673, 1056, 4074, 1257, 1165, 1625, 3505, 1686, 3927, 3842, 3216, 276, 1930,
        1578, 2915, 2400, 3401, 1150, 987, 3350, 2338, 2333, 1489, 3395, 2157, 3475,
        2861, 4067, 2135, 2893, 1518, 3298, 1954, 3512, 2219, 576, 3776, 19, 3784,
        3922, 1769, 1000, 2440, 3949, 1725, 55, 2194, 3764, 1178, 615, 1722, 152,
        476, 2947, 2700, 2076, 1985, 1631, 1823, 1300, 62, 1389, 1821, 3313, 1350,
        15, 3015, 3639, 2281, 4039, 2284, 3560, 4044, 764, 163, 3989, 152, 1347,
        3069, 3801, 3256, 301, 71, 1419, 1781, 2832, 2671, 1977, 450, 472, 1834,
        2478, 2735, 1940, 996, 1954, 269, 408, 246, 1995, 2937, 273, 766, 3012,
        1215, 2538, 2222, 480, 157, 60, 3107, 33, 2551, 246, 482, 4000, 700, 90,
        540, 3359, 1436, 344, 3751, 2657, 3406, 2072, 2245, 2896, 127, 2157, 249,
        2185, 813, 336, 2757, 1456, 1, 2565, 3178, 2235, 2069, 759, 1932, 570, 1386,
        2236, 3192, 3138, 2720, 3819, 1111, 3340, 360, 2998, 3344, 2350, 781, 3474,
        1870, 2608, 2456, 3740, 1845, 2802, 1109, 2042, 1671, 1794, 3774, 3073,
        2339, 3191, 374, 668, 1243, 3421, 1541, 3376, 2986, 2209, 167, 1652, 1908,
        3567, 233, 2703, 3753, 3548, 3642, 3703, 3792, 16, 3612, 867, 2130, 1271,
        318, 440, 1097, 350, 2211, 163, 1226, 3265, 3882, 3513, 3651, 316, 523,
        1757, 1691, 718, 3637, 3634, 2677, 3938, 1781, 2890, 683, 2605, 1631, 2673,
        2347, 274, 1726, 1084, 539, 1368, 1448, 225, 3042, 345, 310, 698, 2257,
        3208, 2427, 330, 4091, 463, 2033, 107, 331, 1968, 1339, 3495, 2764, 3114,
        1095, 2693, 3699, 963, 2466, 1517, 1088, 672, 1658, 1345, 2455, 2454, 223,
        469, 3347, 2699, 1937, 2029, 2467, 1735, 2244, 3866, 1214, 1907, 2717, 47,
        2301, 2051, 1156, 2391, 3241, 2644, 912, 2535, 1911, 1350, 854, 2909, 2001,
        4063, 983, 2565, 3495, 1875, 1187, 4025, 1613, 3390, 1376, 3970, 2297, 1511,
        305, 3331, 2630, 1867, 2989, 1718, 2037, 3504, 3628, 1133, 2705, 864, 3325,
        1106, 2662, 2093, 2283, 753, 494, 3, 2892, 2687, 2244, 4044, 2087, 3200,
        1712, 1879, 1197, 2820, 1473, 2045, 3757, 16, 421, 435, 2504, 1236, 1415,
        3889, 1336, 1754, 2679, 2196, 3680, 3431, 385, 744, 3835, 1959, 3117, 2690,
        2990, 3598, 2355, 1242, 2711, 2032, 2145, 3509, 2963, 567, 1549, 772, 1554,
        249, 184, 228, 1631, 361, 1605, 2984, 2287, 571, 2158, 3658, 1401, 383,
        2495, 777, 869, 3625, 952, 3691, 1831, 1350, 1856, 3872, 1960, 2243, 2234,
        2970, 3468, 1180, 3416, 1551, 4088, 4043, 2043, 3889, 539, 1200, 2145, 2346,
        1641, 1303, 2022, 1924, 1342, 3348, 723, 1766, 1170, 2377, 2732, 2995, 1649,
        3766, 1760, 2390, 1193, 451, 2134, 2568, 486, 987, 548, 3733, 2687, 2357,
        4060, 556, 586, 3663, 1410, 1502, 1637, 2670, 874, 2465, 3958, 3091, 1433,
        471, 1251, 2567, 3695, 1768, 2569, 2546, 585, 1767, 1098, 962, 1900, 1943,
        3367, 3878, 3247, 2893, 3627, 3429, 3668, 3800, 369, 4004, 3444, 2820, 1642,
        2090, 1880, 3611, 1964, 1689, 1369, 679, 2033, 2832, 596, 2040, 3932, 856,
        994, 2678, 2486, 737, 1402, 3979, 3183, 2082, 1323, 3093, 1853, 1704, 3546,
        2967, 659, 2559, 400, 668, 3881, 1090, 3153, 1287, 1183, 2884, 2753, 1757,
        2133, 2618, 1581, 2308, 2742, 3596, 3592, 3789, 2704, 2035, 1098, 494, 1896,
        1581, 2384, 2679, 101, 401, 3097, 69, 3251, 1574, 3695, 1287, 3663, 2378,
        1706, 2136, 2847, 2361, 1416, 1556, 2448, 2072, 3539, 1726, 75, 1927, 3933,
        583, 2838, 1993, 2715, 1825, 2538, 3867, 3039, 3757, 1726, 2808, 141, 1378,
        3750, 849, 1592, 342, 288, 97, 1647, 3110, 540, 1231, 3832, 2012, 3065, 393,
        1695, 626, 2258, 2285, 3782, 1227, 3432, 2595, 1980, 225, 403, 912, 1871,
        3255, 3456, 964, 1053, 1006, 1263, 792, 1377, 1573, 176, 2474, 34, 1257,
        409, 717, 1901, 1119, 873, 3322, 2880, 3092, 2199, 797, 1574, 2379, 2541,
        1689, 427, 2586, 2384, 945, 179, 1001, 2777, 2855, 1207, 3187, 210, 2436,
        1862, 3120, 491, 1030, 1890, 3212, 3658, 2933, 2914, 681, 3592, 93, 2709,
        3270, 112, 3239, 2541, 28, 2323, 3735, 39, 364, 86, 1055, 947, 3367, 3778,
        636, 1269, 3045, 116, 296, 3843, 3650, 338, 3408, 145, 1020, 3632, 435,
        4056, 554, 1456, 3931, 3549, 1028, 2169, 2176, 2798, 344, 3291, 3183, 2904,
        2959, 1293, 3176, 557, 1705, 3583, 3297, 2395, 2157, 976, 399, 803, 228,
        3382, 4035, 3951, 3188, 3822, 1158, 3386, 1849, 3777, 1398, 3793, 2749,
        1691, 247, 278, 493, 3061, 3826, 153, 879, 1070, 2355, 1502, 3198, 999,
        2047, 1762, 1753, 2470, 1331, 2190, 1708, 997, 2280, 1863, 1931, 2690, 4074,
        3585, 2030, 3792, 958, 1425, 1707, 506, 2363, 1847, 2721, 3630, 362, 626,
        1012, 784, 2069, 3268, 3060, 2717, 489, 1421, 1287, 3552, 540, 1486, 1306,
        1736, 3397, 2930, 1499, 3337, 57, 2044, 718, 3081, 2252, 3348, 2806, 2335,
        3172, 2126, 3998, 1304, 2460, 2553, 3548, 3457, 1967, 1844, 2973, 2288, 118,
        810, 2469, 1371, 1522, 279, 1963, 1659, 57, 1260, 2275, 3243, 389, 3952,
        465, 1557, 3294, 2064, 382, 1182, 484, 1698, 1170, 572, 4029, 1395, 3521,
        1009, 3313, 4062, 2595, 2559, 2172, 72, 3685, 3803, 1498, 224, 3731, 2441,
        3514, 2479, 1831, 96, 2615, 878, 2216, 352, 1741, 503, 1701, 327, 2966, 916,
        3139, 2295, 3377, 1137, 1714, 3449, 722, 2728, 3608, 1427, 1876, 971, 3573,
        1661, 1008, 2130, 2689, 821, 2946, 1070, 1511, 2574, 3153, 3913, 1552, 3496,
        2448, 1220, 457, 2640, 118, 3010, 3361, 3749, 2266, 3770, 1788, 524, 1802,
        3054, 2271, 3887, 3728, 1749, 2525, 1498, 3421, 35, 3185, 1150, 1452, 3468,
        1289, 2541, 608, 2601, 269, 2097, 1466, 2073, 1542, 1544, 236, 1082, 2626,
        1117, 1462, 2959, 3254, 1435, 1584, 2672, 1452, 1384, 814, 3983, 2447, 859,
        2087, 3211, 2873, 1842, 2524, 4021, 2025, 1824, 342, 3795, 2637, 2490, 1376,
        1647, 3405, 1709, 2148, 861, 305, 3486, 3263, 690, 1410, 341, 1405, 2148,
        439, 3895, 3074, 425, 1108, 1518, 3874, 854, 797, 2417, 840, 3603, 1178,
        3640, 3018, 2911, 675, 578, 657, 2937, 2478, 2216, 1596, 2886, 1540, 1016,
        4, 1331, 2519, 1255, 1134, 2685, 2129, 3927, 3993, 1793, 3279, 817, 3844,
        1372, 3043, 472, 1522, 3667, 3724, 1115, 104, 1084, 1218, 3029, 3767, 2870,
        3170, 3925, 3452, 973, 3400, 928, 751, 2177, 2972, 62, 3708, 3216, 4081,
        2573, 232, 532, 3128, 1400, 1855, 2601, 3443, 1938, 490, 2985, 8, 1906,
        1517, 1040, 14, 817, 2736, 3031, 240, 546, 3833, 3585, 3193, 990, 1687,
        3489, 3669, 1278, 1746, 3673, 3694, 2077, 743, 3534, 880, 2814, 3330, 3714,
        4038, 3426, 2433, 3181, 2441, 2797, 3547, 274, 940, 1937, 2487, 1964, 1565,
        2240, 2976, 784, 1994, 15, 3599, 2234, 2374, 2175, 3704, 301, 95, 3955,
        2064, 896, 1528, 578, 220, 1574, 1072, 2192, 3048, 2556, 2502, 2240, 1915,
        3715, 3794, 3072, 3282, 2572, 3300, 2035, 3078, 2902, 3887, 1721, 3263,
        1009, 1915, 1247, 3648, 350, 3348, 1651, 1276, 3180, 2334, 2578, 3269, 1203,
        1088, 436, 1827, 3548, 2587, 3299, 3949, 2846, 1692, 3043, 2627, 1653, 4062,
        2388, 680, 3926, 166, 639, 1142, 2405, 1421, 3214, 2027, 1428, 2361, 3456,
        2250, 3648, 2972, 533, 3470, 2157, 1847, 1317, 1708, 3781, 785, 2228, 250,
        2563, 906, 1771, 1688, 1587, 3149, 1748, 2180, 3331, 3389, 2294, 423, 1041,
        190, 982, 1994, 755, 2149, 3773, 1922, 3293, 3233, 300, 3402, 846, 1316,
        2397, 2408, 2425, 2857, 3848, 1097, 3559, 3113, 52, 3200, 964, 815, 3382,
        1242, 4034, 2382, 2853, 743, 3592, 3375, 685, 688, 933, 3038, 3825, 446,
        2557, 3657, 2696, 3087, 1866, 4059, 1593, 1171, 164, 1016, 2375, 2373, 3580,
        3586, 208, 2648, 2261, 1487, 1720, 559, 1116, 1666, 3735, 3944, 3875, 422,
        3886, 1370, 3677, 3071, 1797, 2133, 2522, 804, 3164, 1138, 3442, 3937, 2909,
        1765, 3507, 1010, 3145, 1803, 2101, 3072, 2252, 2533, 1617, 3981, 3593,
        1446, 1508, 3070, 754, 3477, 2722, 2573, 2528, 110, 766, 1593, 3906, 1958,
        3712, 2160, 3184, 2577, 821, 3929, 888, 2165, 322, 2508, 516, 4033, 3297,
        3008, 3297, 2073, 757, 2210, 3969, 2033, 481, 3138, 3901, 3578, 1020, 2160,
        237, 3190, 1360, 3553, 3310, 3969, 851, 1804, 1243, 1712, 2506, 3500, 3469,
        720, 3664, 3137, 2173, 186, 2323, 2198, 2382, 3037, 2661, 3213, 664, 1068,
        3244, 2435, 211, 3897, 1976, 1595, 619, 1676, 13, 3431, 2809, 2512, 518,
        2794, 2701, 484, 916, 1572, 970, 786, 1077, 1854, 3864, 1771, 80, 587, 3045,
        2171, 1159, 4085, 511, 370, 3259, 9, 1977, 3555, 961, 3788, 3926, 450, 135,
        277, 515, 2208, 2922, 4063, 1879, 2394, 824, 1827, 824, 405, 1783, 483,
        1718, 1169, 3737, 3441, 2808, 3326, 3481, 3182, 626, 1129, 3495, 3466, 3935,
        83, 401, 3369, 336, 2954, 2355, 3485, 1562, 370, 413, 567, 2818, 3581, 859,
        209, 3382, 2722, 2060, 1476, 855, 601, 3819, 3928, 2099, 3158, 538, 485,
        837, 840, 3176, 3231, 1056, 1528, 3667, 3623, 2400, 790, 2658, 749, 3115,
        254, 1333, 2409, 1334, 2894, 3703, 1644, 1779, 3676, 847, 3745, 1362, 255,
        191, 3153, 2421, 1775, 2068, 2016, 1827, 3279, 852, 2295, 3979, 4038, 2588,
        2132, 606, 496, 3576, 508, 1915, 1261, 1592, 970, 3458, 3183, 3879, 1933,
        2426, 2477, 259, 1953, 2393, 4040, 1130, 2807, 2397, 326, 4044, 61, 2638,
        332, 3219, 2094, 1448, 1416, 2597, 2607, 2340, 3921, 3573, 3556, 3557, 3603,
        264, 1189, 2079, 995, 2188, 1437, 810, 3105, 1828, 498, 3495, 1253, 1165,
        82, 1455, 1916, 2976, 99, 3774, 1784, 1471, 2874, 2121, 3058, 1307, 71,
        1012, 3399, 582, 1713, 918, 1509, 3076, 3313, 1307, 3051, 3074, 2073, 1243,
        825, 3574, 829, 3028, 3849, 2561, 1365, 461, 50, 100, 2088, 607, 651, 1400,
        3572, 1565, 569, 270, 1392, 340, 3706, 2992, 450, 2113, 679, 1381, 3876,
        243, 4013, 366, 1733, 1010, 1445, 1042, 789, 1600, 2786, 1595, 796, 3670,
        987, 3824, 593, 3069, 4014, 2248, 866, 2830, 3896, 354, 2185, 2455, 2467,
        2320, 2107, 1534, 2670, 1978, 2632, 1679, 38, 2260, 1374, 2619, 2966, 1638,
        2447, 2289, 667, 361, 2647, 704, 2704, 3679, 2808, 1940, 1873, 1580, 1259,
        2237, 723, 2154, 2284, 1848, 3076, 2250, 2498, 3334, 361, 3172, 3369, 3468,
        539, 2594, 2385, 1715, 1254, 881, 3530, 2686, 3063, 2654, 145, 2218, 3711,
        3392, 2429, 1275, 3471, 314, 1024, 3971, 1371, 1355, 3974, 3318, 1819, 2714,
        1814, 2031, 555, 2791, 896, 380, 1662, 1377, 3602, 3447, 2729, 684, 2374,
        391, 2868, 2601, 1545, 2449, 1651, 198, 1140, 302, 3546, 2249, 115, 755,
        3324, 1374, 3705, 3587, 3735, 1642, 2067, 452, 3342, 3069, 1232, 698, 2784,
        540, 570, 2657, 511, 1497, 992, 959, 1301, 1707, 2992, 2306, 4019, 1358,
        809, 1967, 1468, 1531, 1919, 1330, 1197, 404, 1364, 1142, 3059, 3067, 1536,
        2546, 1358, 1653, 71, 3120, 2224, 2437, 2927, 2440, 2138, 1114, 824, 2324,
        1726, 3246, 1541, 2062, 3733, 2749, 3844, 1678, 3838, 1938, 2393, 2321,
        3419, 3709, 3162, 1033, 2216, 1799, 2512, 2171, 2826, 2962, 3531, 1548, 911,
        1386, 3111, 265, 3387, 4046, 3869, 899, 1453, 1559, 1177, 1665, 3498, 811,
        3273, 1545, 403, 1785, 263, 2975, 932, 3279, 2709, 1807, 1895, 3470, 3771,
        3649, 766, 265, 3105, 2402, 3065, 3489, 3392, 3325, 1219, 1362, 272, 449,
        89, 1814, 1424, 1929, 3234, 3643, 3773, 862, 3938, 2957, 3773, 415, 1770,
        2999, 3167, 3992, 3640, 405, 2616, 2046, 919, 1019, 324, 2104, 3851, 3795,
        1571, 2779, 2360, 1915, 2773, 1359, 2850, 1891, 480, 589, 2772, 2449, 977,
        2106, 2539, 1262, 1129, 2383, 3092, 4023, 50, 2228, 367, 3644, 1100, 2055,
        2203, 3067, 3062, 42, 313, 3685, 3606, 1462, 3324, 2052, 2355, 2586, 3762,
        2879, 3653, 38, 783, 1262, 1540, 3002, 1466, 1639, 3472, 1801, 3830, 3801,
        2620, 514, 1183, 2361, 3002, 2043, 2020, 3798, 1198, 3151, 942, 4016, 2957,
        4018, 2874, 4095, 1358, 2796, 2728, 3034, 2927, 1224, 1178, 24, 2396, 3422,
        124, 3164, 635, 170, 4083, 3085, 2528, 1685, 3959, 2319, 3832, 3223, 65,
        3899, 48, 3629, 2633, 3241, 2127, 2291, 2725, 1067, 3772, 2948, 2816, 3493,
        3732, 578, 3219, 4026, 635, 2807, 417, 2868, 929, 3072, 3312, 238, 1584, 92,
        807, 2235, 794, 1233, 3815, 4074, 1105, 141, 1315, 1517, 2346, 1132, 3899,
        3904, 3063, 3085, 1630, 1880, 743, 1825, 1793, 2441, 709, 2477, 3382, 348,
        2626]

    public var systemSortArraysToVerify: ArrayList<Array<Int64>> = ArrayList<Array<Int64>>()
    public var bubbleSortArraysToVerify: ArrayList<Array<Int64>> = ArrayList<Array<Int64>>()
    public var insertionSortArraysToVerify: ArrayList<Array<Int64>> = ArrayList<Array<Int64>>()
    public var mergeSortArraysToVerify: ArrayList<Array<Int64>> = ArrayList<Array<Int64>>()

    public func arraycopycj(src: Array<Int64>, src_index: Int64, dst: Array<Int64>, dst_index: Int64, size: Int64): Array<Int64> {
        if (dst_index + size > dst.size) {
            println("Error! Index out of range.")
        }

        for (i in 0..size) {
            dst[dst_index + i] = src[src_index + i]
        }

        return dst
    }

    public func initArray(array: Array<Int64>): Unit {
        var copyBase: Int64 = 0
        var copySize: Int64 = 0

        while (copyBase < array.size) {
            copySize = min(referenceInputArray.size, array.size - copyBase)
            arraycopycj(referenceInputArray, 0, array, copyBase, copySize)
            copyBase += copySize
        }
    }

    public func arraysEqual(array_1: Array<Int64>, array_2: Array<Int64>): Bool {
        var length: Int64 = min(array_1.size, array_2.size)

        for (i in 0..length) {
            if (array_1[i] != array_2[i]) {
                println("ERROR: Arrays differ at index ${i}: ${array_1[i]} != ${array_2[i]}")
                return false
            }
        }

        if (array_1.size != array_2.size) {
            println("ERROR: Arrays have different lengths: ${array_1.size} != ${array_2.size}")
            return false
        }

        return true
    }

    public func isArraySorted(array: Array<Int64>): Bool {
        for (i in 0..array.size-1) {
            if (array[i] > array[i+1]) {
                println("ERROR: The array is not sorted at index ${i}: ${array[i]} > ${array[i + 1]}")
                return false
            }
        }
        return true
    }

    public func bubbleSort(array: Array<Int64>) {
        for (i in 0..array.size) {
            for (j in 0..array.size-i-1) {
                if (array[j] > array[j+1]) {
                    var temp: Int64 = array[j]
                    array[j] = array[j+1]
                    array[j+1]= temp
                }
            }
        }
    }

    public func benchBubbleSort(arraySize: Int64, iterations: Int64): Unit {
        var array: Array<Int64> = Array<Int64>(arraySize, repeat:0)
        bubbleSortArraysToVerify.add(array)
        for (iter in 0..iterations) {
            initArray(array)
            bubbleSort(array)
        }
    }

    public func verifyBubbleSort(): Bool {
        for (array in bubbleSortArraysToVerify) {
            var ref: Array<Int64> = Array<Int64>(array.size, repeat:0)
            initArray(ref)
            ref.sortBy(comparator: {a, b => a.compare(b)}, stable: true)
            if (!isArraySorted(array) || !arraysEqual(ref, array)) {
                return false
            }
        }
        bubbleSortArraysToVerify.clear()
        return true
    }

    public func insertionSort(array: Array<Int64>): Unit {
        for (k in 1..array.size) {
            var key: Int64 = array[k]
            var i: Int64 = k
            while (i>0 && (array[i-1]>key)) {
                array[i] = array[i - 1]
                i--
            }
            array[i] = key
        }
    }

    public func benchInsertionSort(arraySize: Int64, iterations: Int64): Unit {
        var array: Array<Int64> = Array<Int64>(arraySize, repeat:0)
        insertionSortArraysToVerify.add(array)

        for (iter in 0..iterations) {
            initArray(array)
            insertionSort(array)
        }
    }

    public func verifyInsertionSort() {
        for (array in insertionSortArraysToVerify) {
            var ref: Array<Int64> = Array<Int64>(array.size, repeat:0)
            initArray(ref)
            ref.sortBy(comparator: {a, b => a.compare(b)}, stable: true)
            if (!isArraySorted(array) || !arraysEqual(ref, array)) {
                return false
            }
        }
        insertionSortArraysToVerify.clear()
        return true
    }

    public func mergeSort(array: Array<Int64>, scratch: Array<Int64>): Unit {
        mergeSort(array, 0, array.size, scratch)
    }

    public func mergeSort(array: Array<Int64>, index: Int64, size: Int64, scratch: Array<Int64>): Unit {
        if (size <= 1) {
            return
        }

        var index_1: Int64 = index
        var size_1: Int64 = size / 2
        var index_2: Int64 = index + size_1
        var size_2: Int64 = size - size_1
        mergeSort(array, index_1, size_1, scratch)
        mergeSort(array, index_2, size_2, scratch)
        mergeArrays(array, index_1, size_1, index_2, size_2, scratch)
    }

    public func mergeArrays(array: Array<Int64>, index_1: Int64, size_1: Int64, 
                                          index_2: Int64, size_2: Int64, scratch: Array<Int64>): Unit {
        var end_1: Int64 = index_1 + size_1
        var end_2: Int64 = index_2 + size_2
        var i1: Int64 = index_1
        var i2: Int64 = index_2
        var j: Int64 = 0

        while (i1 != end_1 && i2 != end_2) {
            if (array[i1] < array[i2]) {
                scratch[j] = array[i1]
                i1++
            } else {
                scratch[j] = array[i2]
                i2++
            }
            j++
        }

        if (i1 != end_1) {
            arraycopycj(array, i1, scratch, j, end_1-i1)
        }

        if (i2 != end_2) {
            arraycopycj(array, i2, scratch, j, end_2-i2)
        }

        arraycopycj(scratch, 0, array, index_1, size_1+size_2)
    }

    public func benchMergeSort(arraySize: Int64, iterations: Int64): Unit {
        var array: Array<Int64> = Array<Int64>(arraySize, repeat:0)
        var scratch: Array<Int64> = Array<Int64>(arraySize, repeat:0)

        mergeSortArraysToVerify.add(array)

        for (iter in 0..iterations) {
            initArray(array)
            mergeSort(array, scratch)
        }
    }

    public func verifyMergeSort(): Bool {
        for (array in mergeSortArraysToVerify) {
            var ref: Array<Int64> = Array<Int64>(array.size, repeat:0)
            initArray(ref)
            ref.sortBy(comparator: {a, b => a.compare(b)}, stable: true)
            if (!isArraySorted(array) || !arraysEqual(ref, array)) {
                return false
            }
        }
        mergeSortArraysToVerify.clear()
        return true
    }

    public func systemSort(array: Array<Int64>): Unit {
        array.sortBy(comparator: {a, b => a.compare(b)}, stable: true)
    }

    public func benchSystemSort(arraySize: Int64, iterations: Int64): Unit {
        var array: Array<Int64> = Array<Int64>(arraySize, repeat:0)
        systemSortArraysToVerify.add(array)
        for (iter in 0..iterations) {
            initArray(array)
            systemSort(array)
        }
    }

    public func verifySystemSort(): Bool {
        for (array in systemSortArraysToVerify) {
            var ref: Array<Int64> = Array<Int64>(array.size, repeat:0)
            arraycopycj(array, 0, ref, 0, array.size)
            ref.sortBy(comparator: {a, b => a.compare(b)}, stable: true)
            if (!isArraySorted(array) || !arraysEqual(ref, array)) {
                return false
            }
        }
        systemSortArraysToVerify.clear()
        return true
    }

    public func timeBubbleSort____16(iterations: Int64): Unit { benchBubbleSort(   16, iterations) }
    public func timeBubbleSort___128(iterations: Int64): Unit { benchBubbleSort(  128, iterations) }
    public func timeBubbleSort__2048(iterations: Int64): Unit { benchBubbleSort( 2048, iterations) }

    public func timeInsertionSort____16(iterations: Int64): Unit { benchInsertionSort(   16, iterations) }
    public func timeInsertionSort___128(iterations: Int64): Unit { benchInsertionSort(  128, iterations) }
    public func timeInsertionSort__2048(iterations: Int64): Unit { benchInsertionSort( 2048, iterations) }

    public func timeMergeSort____16(iterations: Int64): Unit { benchMergeSort(   16, iterations) }
    public func timeMergeSort___128(iterations: Int64): Unit { benchMergeSort(  128, iterations) }
    public func timeMergeSort__2048(iterations: Int64): Unit { benchMergeSort( 2048, iterations) }

    public func timeSystemSort____16(iterations: Int64): Unit { benchSystemSort(   16, iterations) }
    public func timeSystemSort___128(iterations: Int64): Unit { benchSystemSort(  128, iterations) }
    public func timeSystemSort__2048(iterations: Int64): Unit { benchSystemSort( 2048, iterations) }
}

main(): Int64 {

    var reps: Int64 = 110000

    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    var obj: MergeSort____16 = MergeSort____16()

    startTime = DateTime.now()
    obj.timeMergeSort____16(reps)
    endTime = DateTime.now()
    perTime = Float64((endTime - startTime).toNanoseconds())/Float64(reps)

    if (obj.verifyMergeSort() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}