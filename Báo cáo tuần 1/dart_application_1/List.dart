import 'dart:core';

var List1 = [];// list rỗng
List<int> numbers = [];

List<dynamic> list2 = [1,"Anh",1.5];
void main()
{ // kiểm tra số phần tử
 /* print(List1.length);
 print(numbers.length); */

 // thêm phần tử
 List1.add(1);
 List1.add(2);

 numbers.add(3);
 numbers.add(4);

 // duyệt danh sách

 /* List1.forEach((i){
  print(i.runtimeType);
  print(i);
 });

 numbers.forEach((i){
  print(i.runtimeType);
  print(i);
 });
 // số phần tử và lấy phần tử đầu phần tử cuối.
 print(numbers.length);
 print(numbers.first);
 print(numbers.last);
 print(numbers[1]);
 print(numbers.isNotEmpty);
 print(numbers.isEmpty); */

List1.add(5);
List1.add(6);
List1.addAll(numbers);

/* List1.forEach((i){
  print(i);
}); */

// chèn phần tử lên đầu ds

List1.insert(0, 0);
List1.insert(2, 10);// vị trí, phần tử

// xóa phần tử
List1.remove(10);// chuyền giá trị muốn xóa
List1.removeAt(1);// chuyền vị trí muốn xóa
List1.removeLast();// xóa vị trí cuối
List1.removeRange(2, 3);// xóa từ vị trí thứ 2 đến vị trí thứ 3
// List1.clear();// xóa danh sách
print(List1.length);
for (var i in List1.reversed) {
  print(i);
}// in ngược chiều danh sách
/* List1.forEach((i){
  print(i);
});
 */
for (var i in list2) {
  print(i.runtimeType);
  print(i);
}
}