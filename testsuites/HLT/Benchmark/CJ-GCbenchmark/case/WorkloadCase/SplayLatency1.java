
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Supplier;
interface NextSetup {
    NextSetup call();
}
interface StaticRunStep {
    void runStep();
}

class Latency {
    public static final int SPLAY_TREE_SIZE = 8000;
    public static final int SPLAY_TREE_MODIFICATIONS = 80;
    public static final int SPLAY_TREE_PAYLOAD_DEPTH = 5;
    public static final int RANDOM_INTIAL_NUMBER = 49734321;
    public static final int TIMES_KILO_MILLISECONDS = 1000;
    public static final int DEFAULT_MIN_ITERATIONS = 32;
    public static final int REFERENCE_SCORE_MIN = 81491;
    public static final int REFERENCE_SCORE_MAX = 2739514;
    public static final int RANDOM_NUMBER_D16 = 0x7ed55d16;
    public static final int RANDOM_NUMBER_23C = 0xc761c23c;
    public static final int RANDOM_NUMBER_7B1 = 0x165667b1;
    public static final int RANDOM_NUMBER_46C = 0xd3a2646c;
    public static final int RANDOM_NUMBER_6C5 = 0xfd7046c5;
    public static final int RANDOM_NUMBER_F09 = 0xb55a4f09;
    public static final int RANDOM_NUMBER_FFF = 0xffffffff;
    public static final int RANDOM_NUMBER_000 = 0x10000000;
    public static final int RANDOM_NUMBER_12 = 12;
    public static final int RANDOM_NUMBER_19 = 19;
    public static final int RANDOM_NUMBER_5 = 5;
    public static final int RANDOM_NUMBER_9 = 9;
    public static final int RANDOM_NUMBER_3 = 3;
    public static final int RANDOM_NUMBER_16 = 16;
    public static final int PERCENTAGE_RADIO = 100;
    public static final int TOFIXED_NUMBER2 = 2;
    public static final int TOFIXED_NUMBER3 = 3;
    public static final int TOFIXED_NUMBER0 = 0;
    public static final int INSERT_NODE_VALUE_REC = 20;
    public static final int NODE_PAYLOAD_NUM_0 = 0;
    public static final int NODE_PAYLOAD_NUM_1 = 1;
    public static final int NODE_PAYLOAD_NUM_2 = 2;
    public static final int NODE_PAYLOAD_NUM_3 = 3;
    public static final int NODE_PAYLOAD_NUM_4 = 4;
    public static final int NODE_PAYLOAD_NUM_5 = 5;
    public static final int NODE_PAYLOAD_NUM_6 = 6;
    public static final int NODE_PAYLOAD_NUM_7 = 7;
    public static final int NODE_PAYLOAD_NUM_8 = 8;
    public static final int NODE_PAYLOAD_NUM_9 = 9;
    public static List<Double> splaySamples = new ArrayList<Double>();
    public static int seed = RANDOM_INTIAL_NUMBER;
    public static double splaySampleTimeStart = 0.0;
    public static int ONE_MILLION = 1000000;

	// Performance.now is used in latency benchmarks, the fallback is Date.now.
    public static double performanceNow() {
        return (double)System.nanoTime() / ONE_MILLION;
    }
    public static void deBugLog(String str) {
        boolean isLog = false;
        if (isLog) {
            System.out.println(str);
        }
    }
}

interface Runner {
    void notifyError(String name, Error error);
    void notifyStep(String result);
}

class SuiteData {
    public int runs;
    public long elapsed;
    SuiteData(int runs, long elapsed) {
        this.runs = runs;
        this.elapsed = elapsed;
    }
}

class SplayLatency1 {
    public String name;
    public Boolean doWarmup;
    public Boolean doDeterministic;
    public Runnable run;
    public Runnable setup;
    public Runnable tearDown;
    public Supplier<List<Double>> latencyResult;
    public int minIterations;

    SplayLatency1(
        String name, 
        Boolean doWarmup, 
        Boolean doDeterministic, 
        Supplier<List<Double>> latencyResult, 
        Runnable run,
        Runnable setup, 
        Runnable tearDown, 
        Integer minIterations
    ) {
        this.name = name;
        this.doWarmup = doWarmup;
        this.doDeterministic = doDeterministic;
        this.run = run;
        this.setup = setup;
        this.tearDown = tearDown;
        this.latencyResult = latencyResult;
        this.minIterations = minIterations != null ? minIterations : Latency.DEFAULT_MIN_ITERATIONS;
    }
    public static void main(String[] args) {
        SplayLatency.start();
    }
}
// SplayLatency1 results hold the benchmark and the measured time used to
// run the benchmark. The benchmark score is computed later once a
// full benchmark suite has run to completion. If latency is set to 0
// then there is no latency score for this benchmark.

class BenchmarkResult {
    public SplayLatency1 benchmark;
    public double time;
    public double latency;

    BenchmarkResult(SplayLatency1 benchmark, double time, double latency) {
        this.benchmark = benchmark;
        this.time = time;
        this.latency = latency;
    }
    // Automatically convert results to numbers. Used by the geometric
    // mean computation.
    public double valueOf() {
        return this.time;
    }
}

// Suites of benchmarks consist of a name and the set of benchmarks in
// addition to the reference timing that the final score will be based
// on. This way, all scores are relative to a reference run and higher
// scores implies better performance.
/**
 * @State
 * @Tags Jetstream2
 */
class BenchmarkSuite {
    public String name;
    public int[] reference;
    public SplayLatency1[] benchmarks;
    public List<BenchmarkResult> results = new ArrayList<>();
    public Runner runner;
    // Keep track of all declared benchmark suites.
    public static List<BenchmarkSuite> suites = new ArrayList<BenchmarkSuite>();
    public static String version = "9";
    public static List<Double> scores = new ArrayList<Double>();
    BenchmarkSuite(String name, int[] reference, SplayLatency1[] benchmarks) {
        this.name = name;
        this.reference = reference;
        this.benchmarks = benchmarks;
        BenchmarkSuite.suites.add(this);
    }
    // To make the benchmark results predictable, we replace Math.random
    // with a 100% deterministic alternative.
    public static void resetRNG() {
        Latency.seed = Latency.RANDOM_INTIAL_NUMBER;
    }
    public static double random() {
		// Robert Jenkins' 32 bit integer hash function.
        Latency.seed = (Latency.seed + Latency.RANDOM_NUMBER_D16 + (Latency.seed << Latency.RANDOM_NUMBER_12))
                & Latency.RANDOM_NUMBER_FFF;
        Latency.seed = (Latency.seed ^ Latency.RANDOM_NUMBER_23C ^ (Latency.seed >>> Latency.RANDOM_NUMBER_19))
                & Latency.RANDOM_NUMBER_FFF;
        Latency.seed = (Latency.seed + Latency.RANDOM_NUMBER_7B1 + (Latency.seed << Latency.RANDOM_NUMBER_5))
                & Latency.RANDOM_NUMBER_FFF;
        Latency.seed = ((Latency.seed + Latency.RANDOM_NUMBER_46C) ^ (Latency.seed << Latency.RANDOM_NUMBER_9))
                & Latency.RANDOM_NUMBER_FFF;
        Latency.seed = (Latency.seed + Latency.RANDOM_NUMBER_6C5 + (Latency.seed << Latency.RANDOM_NUMBER_3))
                & Latency.RANDOM_NUMBER_FFF;
        Latency.seed = (Latency.seed ^ Latency.RANDOM_NUMBER_F09 ^ (Latency.seed >>> Latency.RANDOM_NUMBER_16))
                & Latency.RANDOM_NUMBER_FFF;
        return (double)(Latency.seed & Latency.RANDOM_NUMBER_FFF) / Latency.RANDOM_NUMBER_000;
    }
    public SuiteData data;
    public int index;
    public NextSetup runNextSetup = null; 
    public NextSetup runNextTearDown = null; 
    public NextSetup runNextBenchmark = null;
    public NextSetup runStep(Runner runner) {
        BenchmarkSuite.resetRNG();
        this.results = new ArrayList<BenchmarkResult>();
        this.runner = runner;
        final int length = this.benchmarks.length;
        index = 0;
        data = null;
		
        // Run the setup, the actual benchmark, and the tear down in three
        // separate steps to allow the framework to yield between any of the
        // steps.
        /**
         * @Setup
         */
        runNextSetup = () -> {
            if (index < length) {
                benchmarks[index].setup.run();
                return runNextBenchmark;
            }
            return null;
        };
		
        /**
         * @SplayLatency1
         */
        runNextBenchmark = () -> {
            data = runSingleBenchmark(benchmarks[index], data);
			// If data is null, we're done with this benchmark.
            return data == null ? runNextTearDown : runNextBenchmark.call();
        };
	    /**
	     * @Teardown
	     */
        runNextTearDown = () -> {
            benchmarks[index++].tearDown.run();
            return runNextSetup;
        };
        return runNextSetup.call();
    }
    // Runs all registered benchmark suites and optionally yields between
    // each individual benchmark to avoid running for too long in the
    // context of browsers. Once done, the final score is reported to the
    // runner.
    public static NextSetup continuation;
    public static int aindex;
    public static void runSuites(Runner runner) {
        continuation = null;
        BenchmarkSuite[] suites = BenchmarkSuite.suites.toArray(new BenchmarkSuite[0]);
        int length = suites.length;
        BenchmarkSuite.scores = new ArrayList<Double>();
        aindex = 0;
        StaticRunStep step = new StaticRunStep() {
            public void runStep() {
                while (continuation != null || aindex < length) {
                    if (continuation != null) {
                        continuation = continuation.call();
                    } else {
                        BenchmarkSuite suite = suites[aindex++];
                        continuation = suite.runStep(runner);
                    }
                    if (continuation == null) {
                        this.runStep();
                        return;
                    }
                }
            };
        };
        step.runStep();
    }
  // Runs a single benchmark for at least a second and computes the
  // average time it takes to run a single iteration.
    public SuiteData runSingleBenchmark(SplayLatency1 benchmark, SuiteData data) {
        Consumer<SuiteData> runMeasure = (datas) -> {
            double elapsed = 0;
            double start = Latency.performanceNow();
            int i = 0;
            // Run either for 1 second or for the number of iterations specified
            // by minIterations, depending on the config flag doDeterministic.
            for (i = 0; benchmark.doDeterministic ? i < benchmark.minIterations : elapsed < Latency.TIMES_KILO_MILLISECONDS; i++) {
                benchmark.run.run();
                elapsed = Latency.performanceNow() - start;
            }
            
            if (datas != null) {
                datas.runs += i;
                datas.elapsed += elapsed;
            }
        };
		// Sets up data in order to skip or not the warmup phase.
        if (!benchmark.doWarmup && data == null) {
            data = new SuiteData(0, 0);
        }
        if (data == null) {
            runMeasure.accept(null);
            return new SuiteData(0, 0);
        } else {
            runMeasure.accept(data);
            // If we've run too few iterations, we continue for another second.
            if (data.runs < benchmark.minIterations) {
                return data;
            }
            double uses = (data.elapsed * Latency.TIMES_KILO_MILLISECONDS) / data.runs;
            List<Double> latencySamples = benchmark.latencyResult != null ? benchmark.latencyResult.get()
                    : new ArrayList<>(Arrays.asList(0.0));
            double percentile = 99.5;
            double latency = BenchmarkSuite.averageAbovePercentile(latencySamples, percentile)
                    * Latency.TIMES_KILO_MILLISECONDS;
            this.notifyStep(new BenchmarkResult(benchmark, uses, latency));
            latency /= Latency.TIMES_KILO_MILLISECONDS;
            System.out.println("SplayLatency1: ms = " + latency);
            return null;
        }
    }

  // Computes the average of the worst samples. For example, if percentile is 99, this will report the
  // average of the worst 1% of the samples.
    public static double averageAbovePercentile(List<Double> numbers, double percentile) {
        final List<Double> numbersCopy = new ArrayList<>(numbers);
        Collections.sort(numbersCopy);
		
        final List<Double> numbersWeWant = new ArrayList<Double>();
        final int originalLength = numbersCopy.size();
        while (numbersCopy.size() / originalLength > percentile / Latency.PERCENTAGE_RADIO) {
            numbersWeWant.add(numbersCopy.remove(numbersCopy.size() - 1));
        }
		
        double sum = 0;
        for (Double num : numbersWeWant) {
            sum += num.doubleValue();
        }
		
        final double result = sum / numbersWeWant.size();

        // Do a sanity check.
        if (numbersCopy.size() > 0 && result < numbersCopy.get(numbersCopy.size() - 1).doubleValue()) {
            return result;
        }
        return result;
    }
    // Converts a score value to a string with at least three significant
    // digits.
    public static String formatScore(double value) {
        if (value > Latency.PERCENTAGE_RADIO) {
            return String.format("%." + Latency.TOFIXED_NUMBER0 + "f", value);
        } else {
            return String.format("%." + Latency.TOFIXED_NUMBER3 + "g", value);
        }
    }
    // Notifies the runner that we're done running a single benchmark in
    // the benchmark suite. This can be useful to report progress.
    public void notifyStep(BenchmarkResult result) {
        this.results.add(result);
        if (this.runner != null && this.runner instanceof Runner) {
            this.runner.notifyStep(result.benchmark.name);
        }
    }
	
    // Notifies the runner that running a benchmark resulted in an error.
    public void notifyError(Error error) {
        if (this.runner != null) {
            this.runner.notifyError(this.name, error);
            if (this.runner instanceof Runner) {
                this.runner.notifyStep(this.name);
            }
        }
    }
}

class SplayTree {
	// Pointer to the root node of the tree.
    public Nodes root_ = null;
	// @return {boolean} Whether the tree is empty.
    public boolean isEmpty() {
        return this.root_ == null;
    }

    public void insert(double key, Object value) {
        if (this.isEmpty()) {
            this.root_ = new Nodes(key, value);
            return;
        }

        this.splay_(key);

        if (this.root_ != null && this.root_.key == key) {
            return;
        }
        Nodes node = new Nodes(key, value);
		
        if (key > this.root_.key) {
            node.left = this.root_;
            node.right = this.root_.right;
            this.root_.right = null;
        } else {
            node.right = this.root_;
            node.left = this.root_.left;
            this.root_.left = null;
        }
        this.root_ = node;
    }

    public Nodes remove(double key) {
        this.splay_(key);
        final Nodes removed = this.root_;
        if (this.root_.left == null) {
            this.root_ = this.root_.right;
        } else {
            final Nodes right = this.root_.right;
            this.root_ = this.root_.left;

            this.splay_(key);
            this.root_.right = right;
        }
        return removed;
    }

    public Nodes find(double key) {
        if (this.isEmpty()) {
            return null;
        }
        this.splay_(key);
        return (this.root_ != null && this.root_.key == key) ? this.root_ : null;
    }
  /**
   * @return {SplayTree.Node} Node having the maximum key value.
   */
    public Nodes findMax(Nodes optStartNode) {
        if (this.isEmpty()) {
            return null;
        }
        Nodes current = optStartNode != null ? optStartNode : this.root_;
        while (current.right != null) {
            current = current.right;
        }
        return current;
    }
  /**
   * @return {SplayTree.Node} Node having the maximum key value that
   *     is less than the specified key value.
   */
    public Nodes findGreatestLessThan(double key) {
        if (this.isEmpty()) {
            return null;
        }
        this.splay_(key);
        if (this.root_.key < key) {
            return this.root_;
        } else if (this.root_.left != null) {
            return this.findMax(this.root_.left);
        } else {
            return null;
        }
    }
  /**
   * @return {Array<*>} An array containing all the keys of tree's nodes.
   */
    public Double[] exportKeys() {
        final List<Double> result = new ArrayList<Double>();
        if (!this.isEmpty()) {
            this.root_.traverse_(node -> {
                result.add(node.key);
            });
        }
        return result.toArray(new Double[0]);
    }

    public void splay_(double key) {
        if (this.isEmpty()) {
            return;
        }
        Nodes dummy = new Nodes(0, null);
        Nodes left = dummy;
        Nodes right = dummy;
        Nodes current = this.root_;

        while (true) {
            if (key < current.key) {
                if (current.left == null) {
                    break;
                }
                if (key < current.left.key) {
                    // Rotate right.
                    Nodes tmp = current.left;
                    current.left = tmp.right;
                    tmp.right = current;
                    current = tmp;
                    // check left
                    if (current.left == null) {
                        break;
                    }
                }
                // switch right.
                right.left = current;
                right = current;
                current = current.left;
            } else if (key > current.key) {
                if (current.right == null) {
                    break;
                }
                if (key > current.right.key) {
                    // Rotate left.
                    Nodes tmp = current.right;
                    current.right = tmp.left;
                    tmp.left = current;
                    current = tmp;
                    // check is right
                    if (current.right == null) {
                        break;
                    }
                }
                // switch left
                left.right = current;
                left = current;
                current = current.right;
            } else {
                break;
            }
        }
        // Assemble.
        left.right = current.left;
        right.left = current.right;
        current.left = dummy.right;
        current.right = dummy.left;
        this.root_ = current;
    }
}

class Nodes {
    public double key;
    public Object value;
    public Nodes left;
    public Nodes right;
    Nodes(double key, Object value) {
        this.key = key;
        this.value = value;
        this.right = null;
        this.left = null;
    }
	
    public void traverse_(Consumer<Nodes> f) {
        Nodes current = null;
        if (this != null) {
            Nodes left = this.left;
            if (left != null) {
                left.traverse_(f);
            }
            if (this != null) {
                current = this.right;
            }
        }
        while (current != null) {
            Nodes left = current.left;
            if (left != null) {
                left.traverse_(f);
            }
            f.accept(current);
            current = current.right;
        }
    }
}
class PayloadTreeLastNode {
    public int[] array;
    public String string;
    PayloadTreeLastNode(int[] array, String string) {
        this.array = array;
        this.string = string;
    }
}
class PayloadTreeNode {
    public Object left;
    public Object right;
    PayloadTreeNode(Object left, Object right) {
        this.left = left;
        this.right = right;
    }
}
class SplayLatency implements Runner {
    public double generateKey() {
        // The benchmark framework guarantees that Math.random is
        // deterministic; see base.js.
        return BenchmarkSuite.random();
    }
    public List<Double> splayLatency() {
        return Latency.splaySamples;
    }
    public void splayUpdateStats(double time) {
        final double pause = time - Latency.splaySampleTimeStart;
        Latency.splaySampleTimeStart = time;
        Latency.splaySamples.add(pause);
    }
    public Object generatePayloadTree(int depth, double tag) {
        if (depth == 0) {
            return new PayloadTreeLastNode(
               new int[] {
                    Latency.NODE_PAYLOAD_NUM_0,
                    Latency.NODE_PAYLOAD_NUM_1,
                    Latency.NODE_PAYLOAD_NUM_2,
                    Latency.NODE_PAYLOAD_NUM_3,
                    Latency.NODE_PAYLOAD_NUM_4,
                    Latency.NODE_PAYLOAD_NUM_5,
                    Latency.NODE_PAYLOAD_NUM_6,
                    Latency.NODE_PAYLOAD_NUM_7,
                    Latency.NODE_PAYLOAD_NUM_8,
                    Latency.NODE_PAYLOAD_NUM_9
            },
            "String for key" + tag + "in leaf node");
        } else {
            return new PayloadTreeNode(generatePayloadTree(depth - 1, tag), generatePayloadTree(depth - 1, tag));
        }
    }
    public double insertNewNode() {
		// Insert new node with a unique key.
        double key;
        do {
            key = generateKey();
        } while (splayTree.find(key) != null);
        final Object payload = generatePayloadTree(Latency.SPLAY_TREE_PAYLOAD_DEPTH, key);
        if (splayTree != null) splayTree.insert(key, payload);
        return key;
    }
    public void splayRun() {
        // Replace a few nodes in the splay tree.
        for (int i = 0; i < Latency.SPLAY_TREE_MODIFICATIONS; i++) {
            final double key = insertNewNode();
            // Latency.deBugLog("This is SplayRun input Node key: " + key);
            final Nodes greatest = splayTree != null ? splayTree.findGreatestLessThan(key) : null;
            if (greatest == null) {
                if (splayTree != null) splayTree.remove(key);
            } else {
                // Latency.deBugLog("This is SplayRun output greatest Node key: " + greatest.key);
                if (splayTree != null) splayTree.remove(greatest.key);
                // Latency.deBugLog("This is SplayRun output remove Node key: " + greatest.key);
            }
        }
        splayUpdateStats((double)Latency.performanceNow());
    }
    public void splaySetup() {
        splayTree = new SplayTree();
        Latency.splaySampleTimeStart = (double)Latency.performanceNow();
        for (int i = 0; i < Latency.SPLAY_TREE_SIZE; i++) {
            double key = insertNewNode();
            // Latency.deBugLog("This is InsertNewNode key: " + key);
            if ((i + 1) % Latency.INSERT_NODE_VALUE_REC == Latency.INSERT_NODE_VALUE_REC - 1) {
                splayUpdateStats((double)Latency.performanceNow());
            }
        }
    }
    public void splayTearDown() {
        // Allow the garbage collector to reclaim the memory
        // used by the splay tree no matter how we exit the
        // tear down function.
        final Double[] keys = splayTree != null ? splayTree.exportKeys() : null;
        if (keys == null) {
            return;
        }
        splayTree = null;
        Latency.splaySamples = new ArrayList<Double>();
        // Verify that the splay tree has the right size.
        final int length = keys.length;
        if (length != Latency.SPLAY_TREE_SIZE) {
            return;
        }
        // Verify that the splay tree has sorted, unique keys.
        for (int i = 0; i < length - 1; i++) {
            if (keys[i] >= keys[i + 1]) {
                return;
            }
        }
    }

    @Override
    public void notifyError(String name, Error error) {}

    @Override
    public void notifyStep(String result) {}
    public void printResult(String name, Error result) {}
    public void printScore(double score) {}
    public SplayTree splayTree = null;
    
    public static void start() {
        SplayLatency splayLatency = new SplayLatency();
        SplayLatency1 benckmark = new SplayLatency1("Splay", true, false, splayLatency::splayLatency,
        splayLatency::splayRun, splayLatency::splaySetup, splayLatency::splayTearDown,
                Latency.DEFAULT_MIN_ITERATIONS);
        int[] reference = { Latency.REFERENCE_SCORE_MIN, Latency.REFERENCE_SCORE_MIN };
        SplayLatency1[] benchmarks = { benckmark };
        BenchmarkSuite benchmarkSuite = new BenchmarkSuite("Splay", reference, benchmarks);
        BenchmarkSuite.runSuites((Runner) splayLatency);
    }
}