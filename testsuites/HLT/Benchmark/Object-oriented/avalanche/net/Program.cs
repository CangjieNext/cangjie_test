/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
using System.Diagnostics;

if (args.Length != 3)
{
    Console.WriteLine("Usage: program <iterations.per.thread> <threads> <total.repeats>");
    return;
}

var n = long.Parse(args[0]);
var w = int.Parse(args[1]);
var r = int.Parse(args[2]);

Console.WriteLine("Warmup phase...");
Globals.ShouldLog = false;
Measure(w, 100000);

Console.WriteLine("Measurements...");
Globals.ShouldLog = true;
for (var i = 0; i < r; i++)
{
    Measure(w, n);
}

static void Violation()
{
    throw new Exception("Should not reach here!");
}

static Thread StartWorker(CountdownEvent startEvent, CountdownEvent finishEvent, long n)
{
    var thread = new Thread(ThreadBody);
    thread.Start();
    return thread;

    void ThreadBody()
    {
        if (!startEvent.Signal())
            startEvent.Wait();

        WorkerLoop(n);
        finishEvent.Signal();
    }
}

static void WorkerLoop(long n)
{
    // linear congruental generator
    // I suppose that it will not generate 17, ever :)
    const int seed = 1013;
    const int m = 22695477;
    const int inc = 1;

    var randomNum = seed;

    var i = 0;
    object objRef = new WorkloadObject(-1);
    while (i < n)
    {
        object tmp = new WorkloadObject(i);

        if (randomNum == 17)
        {
            Console.WriteLine("i = " + i);

            // fake object escape
            Globals.BlackHole = tmp;
            Globals.BlackHole = objRef;
            Violation();
        }
        else
        {
            objRef = tmp;
        }

        randomNum = m * randomNum + inc; // modulo 2^32, standard int overflow
        i += 1;
    }

    Globals.BlackHole = objRef;
}

static void Measure(int w, long n)
{
    CountdownEvent startEvent = new(w +  1), finishEvent = new(w);
    List<Thread> workers = new(w);

    for (var i = 0; i < w; i++)
    {
        workers.Add(StartWorker(startEvent, finishEvent, n));
    }

    startEvent.Signal();
    startEvent.Wait();
    var timeStart = Stopwatch.GetTimestamp();
    finishEvent.Wait();
    var timeDuration = Stopwatch.GetElapsedTime(timeStart).TotalMilliseconds;

    foreach (var worker in workers)
    {
        worker.Join();
    }

    if (Globals.ShouldLog)
    {
        Console.WriteLine($"{w} worker threads executed {n} iterations each in {timeDuration} ms");
        var eff = 1.0 * w * n / (1.0 * timeDuration);
        Console.WriteLine($"             Throughput: {eff,10:F3} units / msec");
        Console.WriteLine($"  Normalized throughput: {eff / w,10:F3} units / msec");
    }
}