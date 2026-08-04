/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package url

import (
	"net/url"
	"testing"
	"strconv"
)

var u *url.URL
func benchmarkParse(b *testing.B, str string) {
	for i := 0; i < b.N; i++ {
		u, _ = url.Parse(str)
	}
}

func BenchmarkParse_N0(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com")}
func BenchmarkParse_N1(b *testing.B)    { benchmarkParse(b, "http://1.2.3.4:8888/a")}
func BenchmarkParse_Path_N1(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/a")}
func BenchmarkParse_Path_N10(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j")}
func BenchmarkParse_Protocol_Https(b *testing.B)    { benchmarkParse(b, "https://www.cangjie.com")}
func BenchmarkParse_Protocol_File(b *testing.B)    { benchmarkParse(b, "file:///home/cangjie/rabbits")}
func BenchmarkParse_Protocol_Ftp(b *testing.B)    { benchmarkParse(b, "ftp://webmaster@www.cangjie.com/")}
func BenchmarkParse_Query_N1(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/search?q=apple")}
func BenchmarkParse_Query_N5(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100")}
func BenchmarkParse_HostName_N5(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.a.b.c.d.com")}
func BenchmarkParse_Chinese_N1(b *testing.B)    { benchmarkParse(b, "http://www.仓颉.一.二.三.四.com")}
func BenchmarkParse_Chinese_N2(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九")}
func BenchmarkParse_Chinese_N3(b *testing.B)    { benchmarkParse(b, "http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e")}
func BenchmarkParse_Character_N1(b *testing.B)    { benchmarkParse(b, "http://www.%e4%b8%96%e7%95%8c.com")}

func BenchmarkParse_Long(b *testing.B) {
	str := "http://www.cangjie.com"
	for i := 0; i < 100; i++ {
		str += "/abc"
	}
	str += "?nums"
	for i := 0; i < 100; i++ {
		str += "&num" + strconv.Itoa(i) + "=1"
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		u, _ = url.Parse(str)
	}
}

var url_str string
func benchmarkToString(b *testing.B, str string) {
	u, _ = url.Parse(str)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		url_str = u.String()
	}
}

func BenchmarkToString_N0(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com")}
func BenchmarkToString_N1(b *testing.B)    { benchmarkToString(b, "http://1.2.3.4:8888/a")}
func BenchmarkToString_Path_N1(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/a")}
func BenchmarkToString_Path_N10(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j")}
func BenchmarkToString_Protocol_Https(b *testing.B)    { benchmarkToString(b, "https://www.cangjie.com")}
func BenchmarkToString_Protocol_File(b *testing.B)    { benchmarkToString(b, "file:///home/cangjie/rabbits")}
func BenchmarkToString_Protocol_Ftp(b *testing.B)    { benchmarkToString(b, "ftp://webmaster@www.cangjie.com/")}
func BenchmarkToString_Query_N1(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/search?q=apple")}
func BenchmarkToString_Query_N5(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100")}
func BenchmarkToString_HostName_N5(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.a.b.c.d.com")}
func BenchmarkToString_Chinese_N1(b *testing.B)    { benchmarkToString(b, "http://www.仓颉.一.二.三.四.com")}
func BenchmarkToString_Chinese_N2(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九")}
func BenchmarkToString_Chinese_N3(b *testing.B)    { benchmarkToString(b, "http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e")}
func BenchmarkToString_Character_N1(b *testing.B)    { benchmarkToString(b, "http://www.%e4%b8%96%e7%95%8c.com")}

func BenchmarkToString_Long(b *testing.B) {
	str := "http://www.cangjie.com"
	for i := 0; i < 100; i++ {
		str += "/abc"
	}
	str += "?nums"
	for i := 0; i < 100; i++ {
		str += "&num" + strconv.Itoa(i) + "=1"
	}
	u, _ = url.Parse(str)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		url_str = u.String()
	}
}
