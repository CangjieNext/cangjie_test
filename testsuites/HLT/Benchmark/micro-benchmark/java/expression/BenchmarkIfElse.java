/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkIfElse {
    static int m = 2;
    static int n = 2;
    static int k = 2;
    static int l = 2;

    @Benchmark
    public void BenchmarkIfElseD1(Blackhole blackhole) {
        if (n > 16) {
            n = 16;
        } else if (n > 15) {
            n = 15;
        } else if (n > 14) {
            n = 14;
        } else if (n > 13) {
            n = 13;
        } else if (n > 12) {
            n = 12;
        } else if (n > 11) {
            n = 11;
        } else if (n > 10) {
            n = 10;
        } else if (n > 9) {
            n = 9;
        } else if (n > 8) {
            n = 8;
        } else if (n > 7) {
            n = 7;
        } else if (n > 6) {
            n = 6;
        } else if (n > 5) {
            n = 5;
        } else if (n > 4) {
            n = 4;
        } else if (n > 3) {
            n = 3;
        } else if (n > 2) {
            n = 2;
        } else {
            n = 1;
        }
        blackhole.consume(n);
    }

    @Benchmark
    public void BenchmarkIfElseD2(Blackhole blackhole) {
        if (n > 16) {
            if (m > 16) {
                n = 16;
            } else {
                n = 17;
            }
        } else if (n > 15) {
            if (m > 15) {
                n = 15;
            } else {
                n = 16;
            }
        } else if (n > 14) {
            if (m > 14) {
                n = 14;
            } else {
                n = 15;
            }
        } else if (n > 13) {
            if (m > 13) {
                n = 13;
            } else {
                n = 14;
            }
        } else if (n > 12) {
            if (m > 12) {
                n = 12;
            } else {
                n = 13;
            }
        } else if (n > 11) {
            if (m > 11) {
                n = 11;
            } else {
                n = 12;
            }
        } else if (n > 10) {
            if (m > 10) {
                n = 10;
            } else {
                n = 11;
            }
        } else if (n > 9) {
            if (m > 9) {
                n = 9;
            } else {
                n = 10;
            }
        } else if (n > 8) {
            if (m > 8) {
                n = 8;
            } else {
                n = 9;
            }
        } else if (n > 7) {
            if (m > 7) {
                n = 7;
            } else {
                n = 8;
            }
        } else if (n > 6) {
            if (m > 6) {
                n = 6;
            } else {
                n = 7;
            }
        } else if (n > 5) {
            if (m > 5) {
                n = 5;
            } else {
                n = 6;
            }
        } else if (n > 4) {
            if (m > 4) {
                n = 4;
            } else {
                n = 5;
            }
        } else if (n > 3) {
            if (m > 3) {
                n = 3;
            } else {
                n = 4;
            }
        } else if (n > 2) {
            if (m > 2) {
                n = 2;
            } else {
                n = 3;
            }
        } else {
            if (m > 1) {
                n = 1;
            } else {
                n = 2;
            }
        }
        blackhole.consume(m);
        blackhole.consume(n);
    }

    @Benchmark
    public void BenchmarkIfElseD4(Blackhole blackhole) {
        if (n > 16) {
            if (m > 16) {
                if (l > 16) {
                    if (k > 16) {
                        n = 16;
                    } else {
                        n = 17;
                    }
                } else {
                    n = 18;
                }
            } else {
                n = 19;
            }
        } else if (n > 15) {
            if (m > 15) {
                if (l > 15) {
                    if (k > 15) {
                        n = 15;
                    } else {
                        n = 16;
                    }
                } else {
                    n = 17;
                }
            } else {
                n = 18;
            }
        } else if (n > 14) {
            if (m > 14) {
                if (l > 14) {
                    if (k > 14) {
                        n = 14;
                    } else {
                        n = 15;
                    }
                } else {
                    n = 16;
                }
            } else {
                n = 17;
            }
        } else if (n > 13) {
            if (m > 13) {
                if (l > 13) {
                    if (k > 13) {
                        n = 13;
                    } else {
                        n = 14;
                    }
                } else {
                    n = 15;
                }
            } else {
                n = 16;
            }
        } else if (n > 12) {
            if (m > 12) {
                if (l > 12) {
                    if (k > 12) {
                        n = 12;
                    } else {
                        n = 13;
                    }
                } else {
                    n = 14;
                }
            } else {
                n = 15;
            }
        } else if (n > 11) {
            if (m > 11) {
                if (l > 11) {
                    if (k > 11) {
                        n = 11;
                    } else {
                        n = 12;
                    }
                } else {
                    n = 13;
                }
            } else {
                n = 14;
            }
        } else if (n > 10) {
            if (m > 10) {
                if (l > 10) {
                    if (k > 10) {
                        n = 10;
                    } else {
                        n = 11;
                    }
                } else {
                    n = 12;
                }
            } else {
                n = 13;
            }
        } else if (n > 9) {
            if (m > 9) {
                if (l > 9) {
                    if (k > 9) {
                        n = 9;
                    } else {
                        n = 10;
                    }
                } else {
                    n = 11;
                }
            } else {
                n = 12;
            }
        } else if (n > 8) {
            if (m > 8) {
                if (l > 8) {
                    if (k > 8) {
                        n = 8;
                    } else {
                        n = 9;
                    }
                } else {
                    n = 10;
                }
            } else {
                n = 11;
            }
        } else if (n > 7) {
            if (m > 7) {
                if (l > 7) {
                    if (k > 7) {
                        n = 7;
                    } else {
                        n = 8;
                    }
                } else {
                    n = 9;
                }
            } else {
                n = 10;
            }
        } else if (n > 6) {
            if (m > 6) {
                if (l > 6) {
                    if (k > 6) {
                        n = 6;
                    } else {
                        n = 7;
                    }
                } else {
                    n = 8;
                }
            } else {
                n = 9;
            }
        } else if (n > 5) {
            if (m > 5) {
                if (l > 5) {
                    if (k > 5) {
                        n = 5;
                    } else {
                        n = 6;
                    }
                } else {
                    n = 7;
                }
            } else {
                n = 8;
            }
        } else if (n > 4) {
            if (m > 4) {
                if (l > 4) {
                    if (k > 4) {
                        n = 4;
                    } else {
                        n = 5;
                    }
                } else {
                    n = 6;
                }
            } else {
                n = 7;
            }
        } else if (n > 3) {
            if (m > 3) {
                if (l > 3) {
                    if (k > 3) {
                        n = 3;
                    } else {
                        n = 4;
                    }
                } else {
                    n = 5;
                }
            } else {
                n = 6;
            }
        } else if (n > 2) {
            if (m > 2) {
                if (l > 2) {
                    if (k > 2) {
                        n = 2;
                    } else {
                        n = 3;
                    }
                } else {
                    n = 4;
                }
            } else {
                n = 5;
            }
        } else {
            if (m > 1) {
                if (l > 1) {
                    if (k > 1) {
                        n = 1;
                    } else {
                        n = 2;
                    }
                } else {
                    n = 3;
                }
            } else {
                n = 4;
            }
        }
        blackhole.consume(m);
        blackhole.consume(n);
        blackhole.consume(k);
        blackhole.consume(l);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkIfElse.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
