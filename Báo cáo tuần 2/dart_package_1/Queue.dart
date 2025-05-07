// Queue
import 'dart:collection';

var q = Queue();
var test  = ["x","y","z"];
var q2 = Queue<int>();
Queue<dynamic> check = Queue();
void main(){
print(q.length);
// add phần tử
q.add("A");
q.add("B");
// Duyệt các phần tử
print("-------------------");
q.addFirst("C");//add lên đầu
q.addLast("D");//add phía cuối
q.addAll(test);//add test vào Queue
// xóa phần tử
q.remove("y");
q.removeFirst();
q.removeLast();
q.clear();// xóa tất cả hàng đợi
for (var i in q) {
  print(i);
}
check.addAll(test);
check.add(1);
check.add(1.67);
for (var i in check) {
  print(i);
}
// lấy 1 phần tử trong hàng đợi
print("-----------------");
print(check.elementAt(3));
print(check.last);
print(check.first);
print(check.isEmpty);

}