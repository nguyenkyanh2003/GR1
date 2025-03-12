// ignore: file_names
var map1 = {};
var map2 = {'id':1,'name':'Kỳ Anh'};// phân tách key values bằng dấu 2 chấm còn phẩn tử phân cách nhau bằng dấu ,
var map3 = {'id':2,'name':'Linh'};
var map4 = {'id2':3,'name2':'Phuong'};
void main(){
 // kiểm tra phần tử
/*  print(map1.length);
 print(map2.length);
 map2.forEach((key, valuse){
  print('$key-$valuse');
 }); */
 // thêm phần tử vào map
 map1['number1']=1;
 map1.addAll(map2);// thêm map2 vào map1;
 map1.addAll(map3);// khi các key trùng nhau map3 đè lên map2
 map1.addAll(map4);
 print(map1.length);
  map1.forEach((key, valuse){
  print('$key-$valuse');
 });
 // lấy ra một phần tử trong map
 print('----------------------');
 print(map1['name']);
 // xóa phần tử của map
 print('------------------------');
 map1.remove('id2');// xóa 1 phần tử 
//  map1.clear();//xóa hết phần tử
 map1.forEach((key,valuse){
print('$key - $valuse');
 });
 // kiểm tra trong map có key tên '...' hay k?

print('---------------------');
bool check1 = map1.containsKey('name2');
bool check2 = map1.containsValue('Linh');
print(check1);
print(check2);
}
