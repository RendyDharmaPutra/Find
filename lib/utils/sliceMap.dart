Map<K, V> sliceMap<K, V>(Map<K, V> original, List<K> keys, String status) {
  Map<K, V> sliced = {};

  original.forEach((K, V) {
    if (status == 'drop' ? !keys.contains(K) : keys.contains(K)) {
      sliced[K] = original[K]!;
    }
  });

  return sliced;
}