enum Persion {tin, hoa , phuong}// kết thúc câu không cần ;
void main()
{
print(Persion.tin);
print(Persion.tin.name);// in ra tên trong enum
print(Persion.values.length);// kích thước
print(Persion.values[0]);// phần tử đầu tiên
print(Persion.values[2]); //Phần tử cuối cùng
print(Persion.values.first); // phần tử đầu tiên
print(Persion.values.last); // phần tử đầu tiên
print(Persion.values.isEmpty);//check có null hay k?
print(Persion.values.isNotEmpty);//check xem có chống hay k?

for (var a in Persion.values) {
   print(a.name);// in ra tên trong enum
}// gióng vòng lặp for để in ra từng phần tử
print("switch");
var name = Persion.tin;
   switch(name){
    case Persion.tin:
    print("abc");
    break;

    case Persion.hoa:
    print("Hoa");
    break;
    
    case Persion.phuong:
    print("Phương");

    default:
    break;
   }
}
