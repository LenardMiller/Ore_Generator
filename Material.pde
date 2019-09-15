class Material{
  PImage sprite;
  PImage spriteHigh;
  String name;
  String effect;
  PVector rgbBase;
  PVector rgbHigh;
  float value;
  int spriteId;
  int highMode;
  int eatEffectDuration;
  int hunger;
  int trade;
  int burn;
  int armor;
  boolean metal = false;
  boolean uTools;
  boolean uArmor;
  boolean uBlock;
  boolean uDecor;
  boolean uDye;
  boolean uItem;
  boolean uLight;
  boolean uFuel;
  boolean uTrade;
  boolean uEatHunger;
  boolean uEatEffect;
  boolean uPotion;
  boolean uEnchant;
  Material(){
    effect = effects[floor(random(0,28.99))];
    int m = floor(random(0,1.99));
    if (m == 0){metal = true;}  
    value = 0;
    setName();
    setUses();
    if (uEatEffect){
      eatEffectDuration = floor(random(3,30));
      if (effectsValue.get(effect) > 0 && !(effect == ("instant health") || effect == ("instant damage"))){
        value += eatEffectDuration*effectsValue.get(effect);  
      }
    } 
    if (uEatHunger){ //does a little exponential growth of value
      hunger = floor(random(1,10.99));
      float v = 1;
      for (int i = 0; i < hunger; i++){
        v*=1.15;
      }  
      v*=hunger;
      value+=v;
    }  
    if (uTrade){
      trade = floor(random(1,25));
      value += trade/2;
    }  
    if (uFuel){
      burn = floor(random(1,12));
      value += burn;
    }  
    if (uArmor){
      armor = floor(random(4,20.99));
      float v = 1;
      for (int i = 0; i < armor; i++){
        v*=1.03;
      }  
      v*=armor;
      value+=v;
    }  
    if (uPotion){
      if (!(effect == ("instant health") || effect == ("instant damage"))){
        value += abs(effectsValue.get(effect))*20;  
      }
      else{
        value += abs(effectsValue.get(effect));
      }  
    }  
    //sprite stuff
    rgbBase = new PVector(floor(random(0,255)),floor(random(0,255)),floor(random(0,255)));
    highMode = floor(random(0,2.99)); //none, bright, colorful (placeholder weights)
    float n = .1;
    PVector colorChange = new PVector((255-rgbBase.x)*n,(255-rgbBase.y)*n,(255-rgbBase.z)*n);
    if (highMode == 1){ //bright
      value += 2;
      rgbHigh = new PVector();
      PVector.add(colorChange,rgbBase,rgbHigh);
    }  
    else if (highMode == 2){ //colorful
      value += 5;
      rgbHigh = new PVector();
      PVector cc = new PVector(random(0,255),(random(0,255)),(random(0,255)));
      PVector.add(cc,rgbBase,rgbHigh);
    }  
    if (metal){
      spriteId = floor(random(0,sprites.get("metalM").length-.01));
      sprite = sprites.get("metalM")[spriteId];
      spriteHigh = sprites.get("metalHighM")[spriteId];
    }
    else{
      spriteId = floor(random(0,sprites.get("nonMetalM").length-.01));
      sprite = sprites.get("nonMetalM")[spriteId];
      spriteHigh = sprites.get("nonMetalHighM")[spriteId];
    }
    
    if(value==0){loadStuff();} //start over if completly useless  
  }  
  void setName(){
    name = "";
    int n = floor(random(0,1.99));
    float e = 0;
    int m = 10;
    while (e < m){
      e += random(0,8);
      if (n == 0){ //vowel
        name += vowChunk[floor(random(0,float(vowChunk.length)-.001))];
      }
      else if (n == 1){ //constanant
        name += conChunk[floor(random(0,float(conChunk.length)-.001))];
      }  
      
      if (e >= m){ //end
        int x = floor(random(0,1.99));
        if (x == 1 && n == 1){ //ending
          name += endChunk[floor(random(0,float(endChunk.length)-.001))];
        }  
      }
      if (n == 0){ //swap from vow to con
        n = 1;  
      }  
      else{ //swap from con to vow
        n = 0;  
      }  
    }
    //capitalizes first letter
    String s = name.substring(0,1);
    name = name.substring(1,name.length());
    s = s.toUpperCase();
    name = s+name;
  }
  void setUses(){
    float r;
    float mc = 2;
    float mu = 3;
    r = random(0,mc);
    if (r <= 1){uTools = true;}
    r = random(0,mc);
    if (r <= 1){uArmor = true;}
    r = random(0,mc);
    if (r <= 1){uBlock = true;}
    r = random(0,1.8);
    if (r <= 1){uDecor = true;value+=2;}
    r = random(0,mc);
    if (r <= 1){uDye = true;value+=5;}
    r = random(0,mc);
    if (r <= 1){uItem = true;value+=6;}
    r = random(0,mc);
    if (r <= 1){uLight = true;value+=6;}
    r = random(0,mc);
    if (r <= 1){uFuel = true;}
    r = random(0,mu);
    if (r <= 1){uTrade = true;}
    r = random(0,mu);
    if (r <= 1 && !metal){uEatHunger = true;}
    r = random(0,4);
    if (r <= 1 && !metal){uEatEffect = true;}
    r = random(0,4);
    if (r <= 1){uPotion = true;}
    r = random(0,mu);
    if (r <= 1 && !metal){uEnchant = true;value+=6;}
  }  
  void mMain(){
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(sprite,width/2-80,50,160,160);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(spriteHigh,width/2-80,50,160,160);
      tint(255);
    }
    
    if (highMode != 0){fill(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));}
    else{fill(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));}
    rect(0,50,50,160);
    fill(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    rect(width-50,50,50,160);
    
    textAlign(CENTER);
    fill(255);
    textFont(bigF);
    if (metal){
      text(name + " ingot",width/2,40);
    }
    else{
      text(name,width/2,45);
    }  
    textFont(mediumF);
    text("Value: " + round((value)*10.0)/10.0,width/2,230);
    
    int x;
    
    if (uTools || uArmor || uBlock || uDecor || uDye || uItem || uLight){
      textAlign(LEFT);
      textFont(mediumF);
      text("Can be used to craft:",20,270);
      textFont(littleF);
      x = 290;
      if (uTools){text(name + " tools",20,x); x+=20;}
      if (uArmor){text(name + " armor with "+armor+" total defense",20,x); x+=20;}
      if (uBlock){text(name + " block",20,x); x+=20;}
      if (uDecor){text(name + " decorative block",20,x); x+=20;}
      if (uDye){text("Dye",20,x); x+=20;}
      if (uItem){text("A unique item",20,x); x+=20;}
      if (uLight){text(name + " light",20,x); x+=20;}
    }
    
    if (uFuel || uTrade || uEatHunger || uEatEffect || uPotion || uEnchant){
      textFont(mediumF);
      text("Can be:",20,470);
      textFont(littleF);
      x = 490;
      if (uFuel){text("Burned to smelt "+burn+" items",20,x); x+=20;}
      if (uTrade){text("Traded for "+trade+" emeralds",20,x); x+=20;}
      if (uEatHunger){text("Eaten for "+hunger+" hunger",20,x); x+=20;}
      if (effect == ("instant health") || effect == ("instant damage")){
        if (uEatEffect){text("Eaten for "+effect,20,x); x+=20;}
      }
      else{
        if (uEatEffect){text("Eaten for "+effect+" for " + eatEffectDuration + " seconds",20,x); x+=20;}
      }  
      if (uPotion){text("Brewed into a potion of "+effect,20,x); x+=20;}
      if (uEnchant){text("Used for enchanting",20,x); x+=20;}
    }
  }  
}  
