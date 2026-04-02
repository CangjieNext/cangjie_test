package issue;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class AllSymbolsInt64 {
    static {
        loadLibrary("issue");
    }

    long self;

    public AllSymbolsInt64(long v) {
        self = initCJObjectG_(v);
    }

    private AllSymbolsInt64(long v, $$NativeConstructorMarker __init__) {
    }

    public native long initCJObjectG_(long v);

    public long getValue() {
        return getValue(this.self);
    }

    public native long getValue(long self);

    public void setValue(long v) {
        setValueG_(this.self, v);
    }

    public native void setValueG_(long self, long v);

    @Override
    public boolean equals(Object obj) {
        throw new UnsupportedOperationException("equals is not supported for java proxy object.");
    }

    @Override
    public int hashCode() {
        throw new UnsupportedOperationException("hashCode is not supported for java proxy object.");
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("toString is not supported for java proxy object.");
    }

    public native void deleteCJObject(long self);

    @Override
    public void finalize() {
        deleteCJObject(this.self);
    }
}
