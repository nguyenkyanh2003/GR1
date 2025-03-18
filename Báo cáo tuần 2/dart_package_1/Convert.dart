import 'dart:collection';

import 'package:test/scaffolding.dart';

var numbers = [1,2,3];
List<int> list1 = [4,5,6];
List<String> list2  = ["Ky Anh","Code","Linh"];
void main()
{
// Duyệt từng phần tử ,add tương ứng
Set<String> set1 = {};
list1.forEach((i)
{
  set1.add('$i');
});
print(set1.length);

set1.forEach((i)
{
  print(i.runtimeType);
  print(i);
});
// add tất cả phần tử.
print("-------------------");
Set<String> set2 = {};
set2.addAll(list2); // Khi add phải cùng kiểu dữ liệu
set2.forEach((name)
{
  print(name);
});
// 3, .from();
print("--------------------");
Set<dynamic> set3 = Set.from(numbers);
set3.forEach((i)
{
  print(i);
});
print("--------------------------");
var q = Queue.from(numbers);
q.forEach((i)
{
  print(i);
});
// 4. sử dụng .map()
print("------------------------");
List<String> strnumbers = numbers.map((number){
  return '$number';
}).toList();
strnumbers.forEach((i)
{
print(i.runtimeType);
print(i);
});
print("----------------------");
Set<String> set4 = list1.map((number){
  return '$number';
}).toSet();
set4.forEach((i)
{
  print(i.runtimeType);
  print(i);
});

}
