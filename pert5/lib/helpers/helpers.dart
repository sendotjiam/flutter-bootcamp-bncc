const baseUrl = "https://jsonplaceholder.typicode.com";

int intOrStringValue(dynamic o) {
  if (o is String) o = int.tryParse(o);
  return o ?? 0;
}
