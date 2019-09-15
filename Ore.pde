class Ore{
  PImage sprite;
  PImage spriteHigh;
  PImage block;
  String triesOre;
  String sizeOre;
  String levelOre;
  PVector rgbBase;
  PVector rgbHigh;
  int spawnsin;
  int highMode;
  int range;
  int spawnTries;
  int veinSize;
  int mineLevel;
  Ore(){
    rgbBase = material.rgbBase;
    rgbHigh = material.rgbHigh;
    highMode = material.highMode;
    int s = floor(random(0,1.99));
    if (s == 0){
      spawnsin = 0; 
    }
    else{
      spawnsin = floor(random(0,sprites.get("blockO").length-.01));
    }
    block = sprites.get("blockO")[spawnsin];
    if (material.metal){
      sprite = sprites.get("metalO")[material.spriteId];
      spriteHigh = sprites.get("metalHighO")[material.spriteId];
    }  
    else{
      sprite = sprites.get("nonMetalO")[material.spriteId];
      spriteHigh = sprites.get("nonMetalHighO")[material.spriteId];
    }  
  }  
  void getStats(){
    int r = round(material.value);
    int x = floor(random(0,5));
    
    if(spawnsin==6){r -= 20;} //nether
    if(spawnsin==4){r -= 50;} //end
    if(r < 0){r = 0;}
    
    spawnTries = ceil((-r/6)+20);
    spawnTries -= x;
    if(spawnTries < 1){spawnTries = 1;}
    
    veinSize = ceil((-r/9)+20);
    veinSize += x;
    if(spawnTries < 1){spawnTries = 1;}
    
    range = -r+128;
    range += round(random(-16,16));
    if(range < 8){range = 8;}
    
    mineLevel = round(float(r)/50);
    //0 stone (wood pick), 1 iron (stone pick), 2 diamond (iron pick), 3 obsidian (diamond pick)
    
    if(spawnTries>20){triesOre = "coal+";}
    if(spawnTries==20){triesOre = "iron";}
    if(spawnTries<20 && spawnTries>=15){triesOre = "iron-";}
    if(spawnTries>8 && spawnTries<=14){triesOre = "redstone+";}
    if(spawnTries==8){triesOre = "redstone";}
    if(spawnTries<8 && spawnTries>=6){triesOre = "redstone-";}
    if(spawnTries>2 && spawnTries<=5){triesOre = "gold+";}
    if(spawnTries==2){triesOre = "gold";}
    if(spawnTries==1){triesOre = "diamond";}
    
    if(veinSize>20){sizeOre = "granite+";}
    if(veinSize==20){sizeOre = "granite";}
    if(veinSize==19){sizeOre = "granite-";}
    if(veinSize==18 || veinSize==19){sizeOre = "coal+";}
    if(veinSize==17){sizeOre = "coal";}
    if(veinSize<17 && veinSize>=9){sizeOre = "coal-";}
    if(veinSize>9 && veinSize<=14){sizeOre = "iron+";}
    if(veinSize==8){sizeOre = "redstone";}
    if(veinSize<8 && veinSize>=5){sizeOre = "redstone-";}
    if(veinSize>1 && veinSize<=4){sizeOre = "diamond+";}
    if(veinSize==8){sizeOre = "diamond";}
    if(veinSize<8 && veinSize>=5){sizeOre = "diamond-";}
    if(veinSize>1 && veinSize<=4){sizeOre = "emerald+";}
    if(veinSize==1){sizeOre = "emerald";}
    
    if(mineLevel==0){levelOre = "coal ore";}
    if(mineLevel==1){levelOre = "iron ore";}
    if(mineLevel==2){levelOre = "diamond ore";}
    if(mineLevel>=3){levelOre = "obsidian";}  
  }  
  void oMain(){
    image(block,width/2-80,50,160,160);
    tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
    image(sprite,width/2-80,50,160,160);
    tint(255);
    if (highMode != 0){
      tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
      image(spriteHigh,width/2-80,50,160,160);
      tint(255);
    }
    
    textAlign(CENTER);
    fill(255);
    textFont(bigF);
    text(material.name + " ore",width/2,40);
    textFont(mediumF);
    text("Spawns in " + spawnables[spawnsin],width/2,240);
    
    textFont(littleF);
    textAlign(LEFT);
    text(spawnTries+" spawn tries ("+triesOre+")",20,280);
    text("~"+veinSize+" ores per vein ("+sizeOre+")",20,300);
    text(range+" spawn range",20,320);
    text(levelOre+" mining level",20,340);
  }  
}
