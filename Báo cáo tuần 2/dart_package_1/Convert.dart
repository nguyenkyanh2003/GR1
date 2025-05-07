import 'dart:collection';


var numbers = [1,2,3];
List<int> list1 = [4,5,6];
List<String> list2  = ["Ky Anh","Code","Linh"];
void main()
{
// Duyệt từng phần tử ,add tương ứng
Set<String> set1 = {};
for (var i in list1) {
  set1.add('$i');
}
print(set1.length);

for (var i in set1) {
  print(i.runtimeType);
  print(i);
}
// add tất cả phần tử.
print("-------------------");
Set<String> set2 = {};
set2.addAll(list2); // Khi add phải cùng kiểu dữ liệu
for (var name in set2) {
  print(name);
}
// 3, .from();
print("--------------------");
Set<dynamic> set3 = Set.from(numbers);
for (var i in set3) {
  print(i);
}
print("--------------------------");
var q = Queue.from(numbers);
for (var i in q) {
  print(i);
}
// 4. sử dụng .map()
print("------------------------");
List<String> strnumbers = numbers.map((number){
  return '$number';
}).toList();
for (var i in strnumbers) {
print(i.runtimeType);
print(i);
}
print("----------------------");
Set<String> set4 = list1.map((number){
  return '$number';
}).toSet();
for (var i in set4) {
  print(i.runtimeType);
  print(i);
}

}
