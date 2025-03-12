class Fraction {
  int? _tuSo;
  int?_mauSo;

  Fraction(this._tuSo,this._mauSo);// hàm contracter

  Fraction.zero(){
   _tuSo = 0;
   _mauSo =1;

  }

  void printF(){
  print("${_tuSo}/${_mauSo}");
  }

}