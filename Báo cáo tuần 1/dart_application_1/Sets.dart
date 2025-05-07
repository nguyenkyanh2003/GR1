// khai báo set

var number1 = <int>{};
var number2 =<int> {1,2,3};
Set<int> number3 ={1,2,3,4,5,6};
Set<String> name = {"abc","def","ghk"};
Set <dynamic> test = {1,1.5,"Anh"};
void main(){
  // kiểm tra khích thước
print(number1.length);
print(number2.length);
// duyệt phần tử 
for (var i in number2) {
print(i);
}
print('-------------------');
for (var i in test) {
  print(i.runtimeType);
  print(i);
}

print('------------Thêm phần tử vào trong set-------------');
number1.add(8);
number1.add(10);
for (var i in number1) {
  print(i);
}

// thêm set1 vào set2 khi add phải cùng kiểu dữ liệu
print('------------------------');
number1.addAll(number2);// khi add sẽ loại bỏ các phần tử trùng nhau
for (var i in number1) {
  print(i);
}

print('---------------');
test.addAll(number1);
test.addAll(number2);
test.addAll(number3);
//xóa trong set
test.remove('1.5');// truyền giá trí
// test.clear();// xóa tất cả
for (var i in test) {
  print(i);
}

print('---------------');
print(test.last);
print(test.first);
print(test.elementAt(2));
bool check = test.contains('hoa');
print(check);

}