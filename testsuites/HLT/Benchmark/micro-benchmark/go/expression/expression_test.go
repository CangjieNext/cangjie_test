/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression_test

import (
	"testing"
)

var m = 2
var n = 2
var k = 2
var l = 2

func BenchmarkIfElseD1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		if n > 16 {
			n = 16
		} else if n > 15 {
			n = 15
		} else if n > 14 {
			n = 14
		} else if n > 13 {
			n = 13
		} else if n > 12 {
			n = 12
		} else if n > 11 {
			n = 11
		} else if n > 10 {
			n = 10
		} else if n > 9 {
			n = 9
		} else if n > 8 {
			n = 8
		} else if n > 7 {
			n = 7
		} else if n > 6 {
			n = 6
		} else if n > 5 {
			n = 5
		} else if n > 4 {
			n = 4
		} else if n > 3 {
			n = 3
		} else if n > 2 {
			n = 2
		} else {
			n = 1
		}
	}
}

func BenchmarkIfElseD2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		if n > 16 {
			if m > 16 {
				n = 16
			} else {
				n = 17
			}
		} else if n > 15 {
			if m > 15 {
				n = 15
			} else {
				n = 16
			}
		} else if n > 14 {
			if m > 14 {
				n = 14
			} else {
				n = 15
			}
		} else if n > 13 {
			if m > 13 {
				n = 13
			} else {
				n = 14
			}
		} else if n > 12 {
			if m > 12 {
				n = 12
			} else {
				n = 13
			}
		} else if n > 11 {
			if m > 11 {
				n = 11
			} else {
				n = 12
			}
		} else if n > 10 {
			if m > 10 {
				n = 10
			} else {
				n = 11
			}
		} else if n > 9 {
			if m > 9 {
				n = 9
			} else {
				n = 10
			}
		} else if n > 8 {
			if m > 8 {
				n = 8
			} else {
				n = 9
			}
		} else if n > 7 {
			if m > 7 {
				n = 7
			} else {
				n = 8
			}
		} else if n > 6 {
			if m > 6 {
				n = 6
			} else {
				n = 7
			}
		} else if n > 5 {
			if m > 5 {
				n = 5
			} else {
				n = 6
			}
		} else if n > 4 {
			if m > 4 {
				n = 4
			} else {
				n = 5
			}
		} else if n > 3 {
			if m > 3 {
				n = 3
			} else {
				n = 4
			}
		} else if n > 2 {
			if m > 2 {
				n = 2
			} else {
				n = 3
			}
		} else {
			if m > 1 {
				n = 1
			} else {
				n = 2
			}
		}
	}
}

func BenchmarkIfElseD4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		if n > 16 {
			if m > 16 {
				if l > 16 {
					if k > 16 {
						n = 16
					} else {
						n = 17
					}
				} else {
					n = 18
				}
			} else {
				n = 19
			}
		} else if n > 15 {
			if m > 15 {
				if l > 15 {
					if k > 15 {
						n = 15
					} else {
						n = 16
					}
				} else {
					n = 17
				}
			} else {
				n = 18
			}
		} else if n > 14 {
			if m > 14 {
				if l > 14 {
					if k > 14 {
						n = 14
					} else {
						n = 15
					}
				} else {
					n = 16
				}
			} else {
				n = 17
			}
		} else if n > 13 {
			if m > 13 {
				if l > 13 {
					if k > 13 {
						n = 13
					} else {
						n = 14
					}
				} else {
					n = 15
				}
			} else {
				n = 16
			}
		} else if n > 12 {
			if m > 12 {
				if l > 12 {
					if k > 12 {
						n = 12
					} else {
						n = 13
					}
				} else {
					n = 14
				}
			} else {
				n = 15
			}
		} else if n > 11 {
			if m > 11 {
				if l > 11 {
					if k > 11 {
						n = 11
					} else {
						n = 12
					}
				} else {
					n = 13
				}
			} else {
				n = 14
			}
		} else if n > 10 {
			if m > 10 {
				if l > 10 {
					if k > 10 {
						n = 10
					} else {
						n = 11
					}
				} else {
					n = 12
				}
			} else {
				n = 13
			}
		} else if n > 9 {
			if m > 9 {
				if l > 9 {
					if k > 9 {
						n = 9
					} else {
						n = 10
					}
				} else {
					n = 11
				}
			} else {
				n = 12
			}
		} else if n > 8 {
			if m > 8 {
				if l > 8 {
					if k > 8 {
						n = 8
					} else {
						n = 9
					}
				} else {
					n = 10
				}
			} else {
				n = 11
			}
		} else if n > 7 {
			if m > 7 {
				if l > 7 {
					if k > 7 {
						n = 7
					} else {
						n = 8
					}
				} else {
					n = 9
				}
			} else {
				n = 10
			}
		} else if n > 6 {
			if m > 6 {
				if l > 6 {
					if k > 6 {
						n = 6
					} else {
						n = 7
					}
				} else {
					n = 8
				}
			} else {
				n = 9
			}
		} else if n > 5 {
			if m > 5 {
				if l > 5 {
					if k > 5 {
						n = 5
					} else {
						n = 6
					}
				} else {
					n = 7
				}
			} else {
				n = 8
			}
		} else if n > 4 {
			if m > 4 {
				if l > 4 {
					if k > 4 {
						n = 4
					} else {
						n = 5
					}
				} else {
					n = 6
				}
			} else {
				n = 7
			}
		} else if n > 3 {
			if m > 3 {
				if l > 3 {
					if k > 3 {
						n = 3
					} else {
						n = 4
					}
				} else {
					n = 5
				}
			} else {
				n = 6
			}
		} else if n > 2 {
			if m > 2 {
				if l > 2 {
					if k > 2 {
						n = 2
					} else {
						n = 3
					}
				} else {
					n = 4
				}
			} else {
				n = 5
			}
		} else {
			if m > 1 {
				if l > 1 {
					if k > 1 {
						n = 1
					} else {
						n = 2
					}
				} else {
					n = 3
				}
			} else {
				n = 4
			}
		}
	}
}

var Sum int64 = 0

func BenchmarkLoopD1(b *testing.B) {
	Sum = 0
	var j int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {

		for j = 0; j < 100000; j++ {
			Sum += j / 2
		}
	}
}

func BenchmarkLoopD2(b *testing.B) {
	Sum = 0
	var j int64 = 0
	var k int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j = 0; j < 1000; j++ {
			for k = 0; k < 100; k++ {
				Sum += (j + k) / 2
			}
		}
	}
}

func BenchmarkLoopD3(b *testing.B) {
	Sum = 0
	var j int64 = 0
	var k int64 = 0
	var l int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j = 0; j < 100; j++ {
			for k = 0; k < 100; k++ {
				for l = 0; l < 10; l++ {
					Sum += (j + k + l) / 2
				}
			}
		}
	}
}

func BenchmarkLoopD4(b *testing.B) {
	Sum = 0
	var j int64 = 0
	var k int64 = 0
	var l int64 = 0
	var m int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j = 0; j < 100; j++ {
			for k = 0; k < 10; k++ {
				for l = 0; l < 10; l++ {
					for m = 0; m < 10; m++ {
						Sum += (j + k + l + m) / 2
					}
				}
			}
		}
	}
}

var a = 16
var bb float64 = 0.0

func BenchmarkMatchD1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		switch a {
		case 1:
			bb = 1.5
		case 2:
			bb = 2.5
		case 3:
			bb = 3.5
		case 4:
			bb = 4.5
		case 5:
			bb = 5.5
		case 6:
			bb = 6.5
		case 7:
			bb = 7.5
		case 8:
			bb = 8.5
		case 9:
			bb = 9.5
		case 10:
			bb = 10.5
		case 11:
			bb = 11.5
		case 12:
			bb = 12.5
		case 13:
			bb = 13.5
		case 14:
			bb = 14.5
		case 15:
			bb = 15.5
		default:
			bb = 16.5
		}
	}
}

func BenchmarkMatchD2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		switch a {
		case 1:
			bb = 1.5
		case 2:
			bb = 2.5
		case 3:
			bb = 3.5
		case 4:
			bb = 4.5
		case 5:
			bb = 5.5
		case 6:
			bb = 6.5
		case 7:
			bb = 7.5
		case 8:
			bb = 8.5
		case 9:
			bb = 9.5
		case 10:
			bb = 10.5
		case 11:
			bb = 11.5
		case 12:
			bb = 12.5
		case 13:
			bb = 13.5
		case 14:
			bb = 14.5
		default:
			switch a {
			case 15:
				bb = 15.5
			default:
				bb = 16.6
			}
		}
	}
}

func BenchmarkMatchD4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		switch a {
		case 1:
			bb = 1.5
		case 2:
			bb = 2.5
		case 3:
			bb = 3.5
		case 4:
			bb = 4.5
		case 5:
			bb = 5.5
		case 6:
			bb = 6.5
		case 7:
			bb = 7.5
		case 8:
			bb = 8.5
		case 9:
			bb = 9.5
		case 10:
			bb = 10.5
		case 11:
			bb = 11.5
		case 12:
			bb = 12.5
		case 13:
			bb = 13.5
		case 14:
			bb = 14.5
		default:
			switch a {
			default:
				switch a {
				default:
					switch a {
					default:
						bb = 15.5
					}
				}
			}
		}
	}
}

type Month int
const (
    January Month = iota
    February
    March
    April
    May
    June
    July
    August
    September
    October
    November
    December
)
var month Month = December
 
func BenchmarkMatchD6(b *testing.B) {
	for i := 0; i < b.N; i++ {
	  switch month {
		case January: m =1
		case February: m =2
		case March: m =3
		case April: m =4
		case May: m = 5
		case June: m = 6
		case July: m = 7
		case August: m = 8
		case September: m = 9
		case October: m = 10
		case November: m = 11
		case December: m = 12
		}
	}
}

func BenchmarkWhileD1(b *testing.B) {
	Sum = 0
	var n int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		n = 0
		for ; n < 100000; {
			n++
			Sum += n / 2
		}
	}
}

func BenchmarkWhileD2(b *testing.B) {
	Sum = 0
	var n int64 = 0
	var m int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		n = 0
		for ; n < 1000; {
			n++
			m = 0
			for ; m < 100; {
				m++
				Sum += (n + m) / 2
			}
		}
	}
}

func BenchmarkWhileD3(b *testing.B) {
	Sum = 0
	var n int64 = 0
	var m int64 = 0
	var j int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		n = 0
		for ; n < 100; {
			n++
			m = 0
			for ; m < 100; {
				m++
				j = 0
				for ; j < 10; {
					j++
					Sum += (n + m + j) / 2
				}
			}
		}
	}
}

func BenchmarkWhileD4(b *testing.B) {
	Sum = 0
	var n int64 = 0
	var m int64 = 0
	var j int64 = 0
	var k int64 = 0
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		n = 0
		for ; n < 100; {
			n++
			m = 0
			for ; m < 10; {
				m++
				j = 0
				for ; j < 10; {
					j++
					k = 0
					for ; k < 10; {
						k++
						Sum += (n + m + j + k) / 2
					}
				}
			}
		}
	}
}
