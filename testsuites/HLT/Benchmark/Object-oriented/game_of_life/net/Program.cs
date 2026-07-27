/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
using System.Diagnostics;

if (args.Length != 1)
{
    Console.WriteLine("Usage: program <repeats>");
    return;
}

var r = int.Parse(args[0]);
for (var i = 0; i < r; i++)
{
    Measure();
}

static void Measure()
{
    int days;
    Planet s;

    // Initialization
    using (TextReader reader = new StreamReader("data.txt"))
    {
        var header = reader.ReadLine().Split(' ', 2);
        var planetSize = int.Parse(header[0]);
        days = int.Parse(header[1]);
        s = new Planet(planetSize, planetSize);

        for (var i = 0; i < planetSize; i++)
        {
            var currentString = reader.ReadLine();
            for (var j = 1; j < planetSize + 1; j++)
            {
                var currentChar = currentString[j];
                if (currentChar == '*')
                {
                    Point t = new(i, j - 1);
                    s[t] = new People(t);
                }
            }
        }
    }

    Console.WriteLine($"Starting a simulation for {days} days");

    // Benchmark itself
    var start = Stopwatch.GetTimestamp();

    for (var i = 0; i < days; i++)
    {
#if VERBOSE
        s.Information();
#endif
        s.NewDay();
    }

    var time = Stopwatch.GetElapsedTime(start).TotalMilliseconds;
    Console.WriteLine($"Total time: {time} ms");
    Console.WriteLine($"Survivors after simulation: {s.Survivors()}");
}