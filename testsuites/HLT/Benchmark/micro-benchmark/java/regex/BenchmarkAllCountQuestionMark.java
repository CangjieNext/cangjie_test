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

import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static regex.BenchmarkRegexAdd.stringBlock;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkAllCountQuestionMark {
    static String regexString = "zo?";

    @Param(value = {"1", "4", "32", "128"})
    static int counts;

    @Param(value = {"32", "256", "2048", "16384"})
    static int stringSize;

    static Matcher matcher;

    @Setup(Level.Invocation)
    public void setup() {
        String matchString = stringBlock(counts, stringSize, "zo", "f");
        Pattern regex = Pattern.compile(regexString);
        matcher = regex.matcher(matchString);
    }

    @Benchmark
    public Integer BenchmarkAllCountQuestionMark_MatchCnt() {
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkAllCountQuestionMark.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
