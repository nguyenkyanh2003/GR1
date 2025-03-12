
import '../classDog/Dog.dart' show Dog;
void main()
{
var myDog = Dog("Thư",16,"Đen");
// print(myDog.name);
print(myDog.color);
print(myDog.name);// gọi hàm khi đã gọi getter

myDog.name="Nicky";// đã khai báo setter 
print(myDog.name);
var yourDog = Dog("Milu",12,"Trắng");
// yourDog.name = "Mix";
// print(yourDog.name);
myDog.bark();
}