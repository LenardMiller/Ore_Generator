void setNameChunks(){
  //constanants
  String[] c = {"w","r","t","tr","tw","y","p","pw","pr","s","sr","sp","b","st","sk","sh","th","f","fr","fw","g","gr","gw","j","h","vr","l",
    "c","cw","vw","z","x","cr","v","qu","m","bw","br","n"};
  conChunk = new String[c.length];
  conChunk = c;
  //vowels
  String[] v = {"e","a","u","o","i","io","oi","ou","ee","oo","ia","ea","ao"};
  vowChunk = new String[v.length];
  vowChunk = v;
  //special endings
  String[] e = {"ite","ium"};
  endChunk = new String[e.length];
  endChunk = e;
}  
