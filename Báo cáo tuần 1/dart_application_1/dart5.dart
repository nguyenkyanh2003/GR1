
// void hamVD(int a, [int? b,int? c ]) // Tham số tùy chọn phải đứng sau tham số bắt buộc
void hamVD({int a=0,int b=0,int c=0})// truyền thẳng tham số cho hàm.
 {
/*   print("Tham so thu nhat : $a");
  print("Tham so thu hai : $b ");
  print("Tham so thu ba : $c"); */
  // ignore: unrelated_type_equality_checks
  if(b!=Null&& c !=Null)
  print("$a - $b - $c");
  // ignore: unrelated_type_equality_checks
  else if(b!=Null)
  print("$a - $b");
  else
  print("$a");
}
void main()
{
 hamVD(a:5 ,b:10 , c:15);// gắn tham số cho hàm
 hamVD(a:3,c:5);
 hamVD(b:10);

}