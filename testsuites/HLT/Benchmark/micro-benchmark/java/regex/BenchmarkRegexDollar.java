/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package regex;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkRegexDollar {
    static ArrayList<MatchResult> matchResults;
    static String regexString = "zo$";

    // 实际未调用
    @Param(value = {"1", "4", "32", "128"})
    static int counts;

    @Param(value = {"32", "256", "2048", "16384"})
    static int stringSize;

    static Matcher matcher;

    @Setup(Level.Invocation)
    public void setup() {
        matchResults = new ArrayList<MatchResult>();
        String matchString1 = new String(new int [stringSize -2], 0, stringSize - 2).replace('\0', 'n') + "zo";
        Pattern regex = Pattern.compile(regexString);
        matcher = regex.matcher(matchString1);
    }

    @Benchmark
    public void BenchmarkRegexDollar_MatchCnt() {
        while (matcher.find()) {
            matchResults.add(matcher.toMatchResult());
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkRegexDollar.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
