/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
#define VERBOSE

using System.Diagnostics;

if (args.Length != 3)
{
    Console.WriteLine("Usage: program <iterations> <repeats> <mode>");
    Console.WriteLine("   where mode == 0 means use ComplexObject");
    Console.WriteLine("   where mode == 1 means use ComplexStruct");
    return;
}

var n = long.Parse(args[0]);
var r = long.Parse(args[1]);
var mode = int.Parse(args[2]);

for (var i = 0; i < r; i++)
{
    switch (mode)
    {
        case 0:
            MeasureObject(n);
            break;
        case 1:
            MeasureStruct(n);
            break;
        default:
            Console.WriteLine($"Unexpected mode: {mode}");
            return;
    }
}

static void MeasureObject(long n)
{
#if VERBOSE
    var start = Stopwatch.GetTimestamp();
#endif

    Globals.BlackHole = MeasureBodyObject(n);

#if VERBOSE
    var end = (long)Stopwatch.GetElapsedTime(start).TotalMilliseconds;
    Console.WriteLine($"ComplexObject with {n} problem size took {end} ms. Computation result: {Globals.BlackHole}");
#endif
}

static long MeasureBodyObject(long n)
{
    long sum = 0;
    for (var i = 0; i < n; i++)
    {
        for (var j = 0; j < n; j++)
        {
            ComplexObject a = i + j > n / 2 ? new(i, j) : new(j, i);
            sum += a.Modulus2;
        }
    }

    return sum;
}

static void MeasureStruct(long n)
{
#if VERBOSE
    var start = Stopwatch.GetTimestamp();
#endif

    Globals.BlackHole = MeasureBodyStruct(n);

#if VERBOSE
    var end = (long)Stopwatch.GetElapsedTime(start).TotalMilliseconds;
    Console.WriteLine($"ComplexStruct with {n} problem size took {end} ms. Computation result: {Globals.BlackHole}");
#endif
}

static long MeasureBodyStruct(long n)
{
    long sum = 0;
    for (var i = 0; i < n; i++)
    {
        for (var j = 0; j < n; j++)
        {
            ComplexStruct a = i + j > n / 2 ? new(i, j) : new(j, i);
            sum += a.Modulus2;
        }
    }

    return sum;
}