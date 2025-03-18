void main(){
/* logInfor();
logInfor2();
logName("Linh");
print(tinhTong(12, 30));
check(1,2,3); */
// check2(1,2,3);
check3(a:1,c:3,b:2);

}
void logInfor()
{
  print("Ky Anh");
}
void logInfor2() => print("Flutter");
void logName(String name)
{
  print(name);
}
int tinhTong(int a,int b) {
   return a+b;
}
void check (int a,int b,int c)
{
  print(a);
  print(b);
  print(c);
}
void check2 (int a,[int? b,int? c])// có thể truyền tham số b,c hoặc k
{
  print(a);
  print(b);
  print(c);
}
void check3 ({int? a,int? b,int? c})// có thể truyền tham số b,c hoặc k
{
  print(a);
  print(b);
  print(c);
}