/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package regex_test

import (
	"fmt"
	"regexp"
	"testing"
)
import "Cangjie-test/testsuites/Benchmark/micro-benchmark/go/regex/internal/genStr"

func benchmarkRun(b *testing.B, specialChar string, matchCnt int, strLen int) {

	regexString, matchString, _ := genStr.GenTestStr(specialChar, matchCnt, strLen)
	regexp, err := regexp.Compile(regexString)
	if err != nil {
		fmt.Printf("get some error when compile %v\n", specialChar)
	}
	// fmt.Printf("b.N = %d\n", strLen)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
	    regexp.FindAllStringSubmatch(matchString, -1)
	}
}

// 32
func BenchmarkRegexStar_MatchCnt_1_32(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[0], genStr.StrLenArray[0])
}
func BenchmarkRegexStar_MatchCnt_4_32(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[1], genStr.StrLenArray[0])
}
func BenchmarkRegexStar_MatchCnt_32_32(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[2], genStr.StrLenArray[0])
}

// 256
func BenchmarkRegexStar_MatchCnt_1_256(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[0], genStr.StrLenArray[1])
}
func BenchmarkRegexStar_MatchCnt_4_256(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[1], genStr.StrLenArray[1])
}
func BenchmarkRegexStar_MatchCnt_32_256(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[2], genStr.StrLenArray[1])
}
func BenchmarkRegexStar_MatchCnt_128_256(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[3], genStr.StrLenArray[1])
}

// 2*1024
func BenchmarkRegexStar_MatchCnt_1_2048(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[0], genStr.StrLenArray[2])
}
func BenchmarkRegexStar_MatchCnt_4_2048(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[1], genStr.StrLenArray[2])
}
func BenchmarkRegexStar_MatchCnt_32_2048(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[2], genStr.StrLenArray[2])
}
func BenchmarkRegexStar_MatchCnt_128_2048(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[3], genStr.StrLenArray[2])
}

// 16*1024
func BenchmarkRegexStar_MatchCnt_1_16384(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[0], genStr.StrLenArray[3])
}
func BenchmarkRegexStar_MatchCnt_4_16384(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[1], genStr.StrLenArray[3])
}
func BenchmarkRegexStar_MatchCnt_32_16384(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[2], genStr.StrLenArray[3])
}
func BenchmarkRegexStar_MatchCnt_128_16384(b *testing.B) {
	benchmarkRun(b, genStr.SpecialChar[0], genStr.MatchCnt[3], genStr.StrLenArray[3])
}
