/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package regex_test

import (
	"testing"
)
import "Cangjie-test/testsuites/Benchmark/micro-benchmark/go/regex/internal/genStr"

// 32
func BenchmarkAllCountBraces_MatchCnt_1_32(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[0], genStr.StrLenArray[0])
}
func BenchmarkAllCountBraces_MatchCnt_4_32(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[1], genStr.StrLenArray[0])
}
func BenchmarkAllCountBraces_MatchCnt_32_32(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[2], genStr.StrLenArray[0])
}

// 256
func BenchmarkAllCountBraces_MatchCnt_1_256(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[0], genStr.StrLenArray[1])
}
func BenchmarkAllCountBraces_MatchCnt_4_256(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[1], genStr.StrLenArray[1])
}
func BenchmarkAllCountBraces_MatchCnt_32_256(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[2], genStr.StrLenArray[1])
}
func BenchmarkAllCountBraces_MatchCnt_128_256(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[3], genStr.StrLenArray[1])
}

// 2*1024
func BenchmarkAllCountBraces_MatchCnt_1_2048(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[0], genStr.StrLenArray[2])
}
func BenchmarkAllCountBraces_MatchCnt_4_2048(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[1], genStr.StrLenArray[2])
}
func BenchmarkAllCountBraces_MatchCnt_32_2048(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[2], genStr.StrLenArray[2])
}
func BenchmarkAllCountBraces_MatchCnt_128_2048(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[3], genStr.StrLenArray[2])
}

// 16*1024
func BenchmarkAllCountBraces_MatchCnt_1_16384(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[0], genStr.StrLenArray[3])
}
func BenchmarkAllCountBraces_MatchCnt_4_16384(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[1], genStr.StrLenArray[3])
}
func BenchmarkAllCountBraces_MatchCnt_32_16384(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[2], genStr.StrLenArray[3])
}
func BenchmarkAllCountBraces_MatchCnt_128_16384(b *testing.B) {
	benchmarkRunAllCount(b, genStr.SpecialChar[7], genStr.MatchCnt[3], genStr.StrLenArray[3])
}
