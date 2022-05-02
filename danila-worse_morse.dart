import 'dart:io';
import 'dart:core';

var morsecode = [".-", "-...", "-.-.", "-..", ".", "..-.",
                 "--.", "....", "..", ".---", "-.-", ".-..",
                 "--", "-.", "---", ".--.", "--.-", ".-.",
                 "...", "-", "..-", "...-", ".--", "-..-",
                 "-.--", "--.."];
var alphabetical = ["A", "B", "C", "D", "E", "F",
                    "G", "H", "I", "J", "K", "L",
                    "M", "N", "O", "P", "Q", "R",
                    "S", "T", "U", "V", "W", "X",
                    "Y", "Z"];

void main(){
    var str = stdin.readLineSync();
    morse_decode(str, "");
}

bool is_valid(var str){
    for(var a=0;a<26;a++)
      if(str==morsecode[a])
        return true;
    return false;
}

void morse_decode(var toDecode, var decoded){
  if(toDecode.length == 0)
    print(decoded);
  else{
    for(int a=0;a<26;a++){
      if(toDecode.startsWith(morsecode[a])){
        var currentDecoded = decoded + alphabetical[a];
        var currentToDecode = toDecode.substring(morsecode[a].length);
        morse_decode(currentToDecode, currentDecoded);
      }
    }
  }
}