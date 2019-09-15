class Block{
  PImage blockSprite;
  PImage blockSpriteHigh;
  PImage decorSprite;
  PImage decorSpriteHigh;
  PImage lightSprite;
  PImage lightSpriteHigh;
  PVector rgbBase;
  PVector rgbHigh;
  int page;
  int highMode;
  int spriteId;
  Block(int page){
    this.page = page;
    this.rgbBase = material.rgbBase;
    this.rgbHigh = material.rgbHigh;
    this.highMode = material.highMode;
    getSprite();
  }
  void getSprite(){
    if (material.metal){
      if(material.spriteId==0){spriteId=3;}
      if(material.spriteId==1){spriteId=7;} 
      if(material.spriteId==2){spriteId=6;} 
    }  
    else{
      if(material.spriteId==0){spriteId=4;}
      if(material.spriteId==1){spriteId=8;}
      if(material.spriteId==2){spriteId=1;} 
      if(material.spriteId==3){spriteId=2;} 
      if(material.spriteId==4){spriteId=1;} 
      if(material.spriteId==5){spriteId=0;} 
      if(material.spriteId==6){spriteId=5;} 
    }  
    blockSprite = sprites.get("materialB")[spriteId];
    blockSpriteHigh = sprites.get("materialHighB")[spriteId];
    int r = floor(random(0,13.99));
    decorSprite = sprites.get("decorB")[r];
    decorSpriteHigh = sprites.get("decorHighB")[r];
    r = floor(random(0,2.99));
    lightSprite = sprites.get("lightB")[r];
    lightSpriteHigh = sprites.get("lightHighB")[r];
  }  
  void bMain(){
    //block
    if (material.uBlock){
      tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
      image(blockSprite,width/2-80,50,160,160);
      tint(255);
      if (highMode != 0){
        tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
        image(blockSpriteHigh,width/2-80,50,160,160);
        tint(255);
      }
    }
    //decor
    if (material.uDecor){
      tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
      image(decorSprite,width-(160+55),50,160,160);
      tint(255);
      if (highMode != 0){
        tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
        image(decorSpriteHigh,width-(160+55),50,160,160);
        tint(255);
      }
    }
    //light
    if (material.uLight){
      tint(floor(rgbBase.x),floor(rgbBase.y),floor(rgbBase.z));
      image(lightSprite,55,50,160,160);
      tint(255);
      if (highMode != 0){
        tint(floor(rgbHigh.x),floor(rgbHigh.y),floor(rgbHigh.z));
        image(lightSpriteHigh,55,50,160,160);
        tint(255);
      }
    }
    
    textAlign(CENTER);
    fill(255);
    textFont(bigF);
    text(material.name + " blocks",width/2,40);
  }  
}  
