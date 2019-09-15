class Tool{
  PImage swordSprite;
  PImage swordSpriteHigh;
  PImage pickSprite;
  PImage pickSpriteHigh;
  PImage shovelSprite;
  PImage shovelSpriteHigh;
  PImage axeSprite;
  PImage axeSpriteHigh;
  PImage hoeSprite;
  PImage hoeSpriteHigh;
  PImage handle;
  String handleMat;
  String name;
  String mineSpeedLevel;
  String mineLevel;
  PVector rgbBase;
  PVector rgbHigh;
  int highMode;
  int page;
  int spriteId;
  int damage;
  int durability;
  int mineSpeed;
  int effectDuration;
  boolean isEffect;
  Tool(int page){
    rgbBase = material.rgbBase;
    rgbHigh = material.rgbHigh;
    highMode = material.highMode;
    name = material.name;
    this.page = page;
    getSprite();
    getStats();
  }
  void getSprite(){
    if (material.metal){
      if(material.spriteId==0){spriteId=2;}
      if(material.spriteId==1){spriteId=3;} 
      if(material.spriteId==2){spriteId=0;} 
    }  
    else{
      if(material.spriteId==0){spriteId=0;}
      if(material.spriteId==1){spriteId=1;}
      if(material.spriteId==2){spriteId=2;} 
      if(material.spriteId==3){spriteId=2;} 
      if(material.spriteId==4){spriteId=2;} 
      if(material.spriteId==5){spriteId=3;} 
      if(material.spriteId==6){spriteId=3;} 
    }  
    swordSprite = sprites.get("swordT")[spriteId];
    swordSpriteHigh = sprites.get("swordHighT")[spriteId];
    pickSprite = sprites.get("pickT")[spriteId];
    pickSpriteHigh = sprites.get("pickHighT")[spriteId];
    shovelSprite = sprites.get("shovelT")[spriteId];
    shovelSpriteHigh = sprites.get("shovelHighT")[spriteId];
    axeSprite = sprites.get("axeT")[spriteId];
    axeSpriteHigh = sprites.get("axeHighT")[spriteId];
    hoeSprite = sprites.get("hoeT")[spriteId];
    hoeSpriteHigh = sprites.get("hoeHighT")[spriteId];
    //handle stuff
    int h = -1;
    if(ore.spawnsin==6){h=3;}
    if(ore.spawnsin==4){h=4;}
    if(h==-1){h=floor(random(0,2.99));}
    if(h==0){handleMat="Wooden";}
    if(h==1){handleMat="Bone";}
    if(h==2){handleMat="Sugarcane";}
    if(h==3){handleMat="Blaze Rod";}
    if(h==4){handleMat="End Rod";}
    handle = sprites.get("handleT")[h];
  }  
  void getStats(){
    damage = floor(random(3,8.99));
    if (handleMat == "Blaze Rod"){damage += 2;}  
    if (handleMat == "End Rod"){damage += 3;}  
    if (highMode == 2){damage += 1;}  
    float v = 1;
    for (int i = 0; i < damage; i++){
      v*=1.2;
    }  
    v*=damage;
    material.value+=v;
    
    durability = floor(random(10,2000));
    if (handleMat == "End Rod"){durability += 300;}  
    v = 1;
    int dv = round(float(durability)/100);
    for (int i = 0; i < dv; i++){
      v*=1.025;
    }  
    v*=dv;
    material.value+=v;
    
    mineSpeed = floor(random(2,13));
    if (handleMat == "Blaze Rod"){mineSpeed += 2;}  
    if (handleMat == "End Rod"){mineSpeed += 3;}  
    if (highMode == 2){mineSpeed += 1;}
    v = 1;
    for (int i = 0; i < mineSpeed; i++){
      v*=1.1;
    }  
    v*=mineSpeed;
    material.value+=v;
    if(mineSpeed==1){mineSpeedLevel="nothing";}
    if(mineSpeed==2){mineSpeedLevel="wood";}
    if(mineSpeed==3){mineSpeedLevel="wood+";}
    if(mineSpeed==4){mineSpeedLevel="stone";}
    if(mineSpeed==5){mineSpeedLevel="stone+";}
    if(mineSpeed==6){mineSpeedLevel="iron";}
    if(mineSpeed==7){mineSpeedLevel="iron+";}
    if(mineSpeed==8){mineSpeedLevel="diamond";}
    if(mineSpeed>8&&mineSpeed<12){mineSpeedLevel="diamond+";}
    if(mineSpeed==12){mineSpeedLevel="gold";}
    if(mineSpeed>12){mineSpeedLevel="gold+";}
    
    int ml = floor(random(1,4.99));
    v = 1;
    for (int i = 0; i < ml; i++){
      v*=1.2;
    }  
    v*=ml;
    material.value+=v;
    if(ml==1){mineLevel="wood";}
    if(ml==2){mineLevel="stone";}
    if(ml==3){mineLevel="iron";}
    if(ml==4){mineLevel="diamond";}
    
    effectDuration = floor(random(3,30));
    int e = floor(random(0,2.99)); //afflict effect
    if (e == 0 && !(material.effect == ("instant health") || material.effect == ("instant damage"))){
      if (effectsValue.get(material.effect) < 0){
        material.value += effectDuration*(effectsValue.get(material.effect)*-2);  
        isEffect = true;
      }
    }
  }  
  void tMain(){
    int s = 120;
    int y = 70;
    int x = 50;
    //sword
    image(handle,x,y,s,s);
    //pick
    image(handle,x+120,y,s,s);
    //shovel
    image(handle,x+240,y,s,s);
    //axe
    image(handle,x+360,y,s,s);
    //hoe
    image(handle,x+480,y,s,s);
    
    //sword
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(swordSprite,x,y,s,s);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(swordSpriteHigh,x,y,s,s);
      tint(255);
    }
    //pick
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(pickSprite,x+120,y,s,s);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(pickSpriteHigh,x+120,y,s,s);
      tint(255);
    }
    //shovel
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(shovelSprite,x+240,y,s,s);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(shovelSpriteHigh,x+240,y,s,s);
      tint(255);
    }
    //axe
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(axeSprite,x+360,y,s,s);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(axeSpriteHigh,x+360,y,s,s);
      tint(255);
    }
    //hoe
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(hoeSprite,x+480,y,s,s);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(hoeSpriteHigh,x+480,y,s,s);
      tint(255);
    }
    
    textAlign(CENTER);
    fill(255);
    textFont(bigF);
    text(name + " tools",width/2,40);
    textFont(mediumF);
    text(handleMat+" handle",width/2,240);
    
    textFont(littleF);
    textAlign(LEFT);
    text(damage+" attack damage",20,280);
    text(durability+" durability",20,300);
    text(mineSpeed+"x mining speed ("+mineSpeedLevel+")",20,320);
    text(mineLevel+" mining level",20,340);
    y = 360;
    if (isEffect){text("Afflicts "+material.effect+" for " + effectDuration + " seconds",20,y);y+=20;}
  }  
}  
