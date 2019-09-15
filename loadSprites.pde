void loadSprites(){
  //materials
    //base
      sprites.put("nonMetalM",new PImage[7]);
      for (int i = 6; i >= 0; i--){
        sprites.get("nonMetalM")[i] = loadImage("sprites/material/nonMetal/base/"+nf(i,3)+".png");
      }  
      sprites.put("metalM",new PImage[3]);
      for (int i = 2; i >= 0; i--){
        sprites.get("metalM")[i] = loadImage("sprites/material/metal/base/"+nf(i,3)+".png");
      }  
    //high
      sprites.put("metalHighM",new PImage[3]);
      for (int i = 2; i >= 0; i--){
        sprites.get("metalHighM")[i] = loadImage("sprites/material/metal/highlight/"+nf(i,3)+".png");
      }  
      sprites.put("nonMetalHighM",new PImage[7]);
      for (int i = 6; i >= 0; i--){
        sprites.get("nonMetalHighM")[i] = loadImage("sprites/material/nonMetal/highlight/"+nf(i,3)+".png");
      }  
  //ores
    sprites.put("blockO",new PImage[10]);
    for (int i = 9; i >= 0; i--){
      sprites.get("blockO")[i] = loadImage("sprites/ore/block/"+nf(i,3)+ ".png"); 
    }  
    //base
      sprites.put("nonMetalO",new PImage[7]);
      for (int i = 6; i >= 0; i--){
        sprites.get("nonMetalO")[i] = loadImage("sprites/ore/nonMetal/base/"+nf(i,3)+ ".png"); 
      }  
      sprites.put("metalO",new PImage[3]);
      for (int i = 2; i >= 0; i--){
        sprites.get("metalO")[i] = loadImage("sprites/ore/metal/base/"+nf(i,3)+ ".png"); 
      }  
    //highlight
      sprites.put("nonMetalHighO",new PImage[7]);
      for (int i = 6; i >= 0; i--){
        sprites.get("nonMetalHighO")[i] = loadImage("sprites/ore/nonMetal/highlight/"+nf(i,3)+ ".png"); 
      }  
      sprites.put("metalHighO",new PImage[3]);
      for (int i = 2; i >= 0; i--){
        sprites.get("metalHighO")[i] = loadImage("sprites/ore/metal/highlight/"+nf(i,3)+ ".png"); 
      }  
  //tools
    //handle
      sprites.put("handleT",new PImage[5]);
      for (int i = 4; i >= 0; i--){
        sprites.get("handleT")[i] = loadImage("sprites/tool/handle/"+nf(i,3)+ ".png"); 
      }  
    //sword
      //base
        sprites.put("swordT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("swordT")[i] = loadImage("sprites/tool/sword/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("swordHighT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("swordHighT")[i] = loadImage("sprites/tool/sword/highlight/"+nf(i,3)+ ".png"); 
        } 
    //pickaxe
      //base
        sprites.put("pickT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("pickT")[i] = loadImage("sprites/tool/pickaxe/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("pickHighT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("pickHighT")[i] = loadImage("sprites/tool/pickaxe/highlight/"+nf(i,3)+ ".png"); 
        } 
    //shovel
      //base
        sprites.put("shovelT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("shovelT")[i] = loadImage("sprites/tool/shovel/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("shovelHighT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("shovelHighT")[i] = loadImage("sprites/tool/shovel/highlight/"+nf(i,3)+ ".png"); 
        } 
     //axe
      //base
        sprites.put("axeT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("axeT")[i] = loadImage("sprites/tool/axe/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("axeHighT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("axeHighT")[i] = loadImage("sprites/tool/axe/highlight/"+nf(i,3)+ ".png"); 
        } 
     //hoe
      //base
        sprites.put("hoeT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("hoeT")[i] = loadImage("sprites/tool/hoe/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("hoeHighT",new PImage[4]);
        for (int i = 3; i >= 0; i--){
          sprites.get("hoeHighT")[i] = loadImage("sprites/tool/hoe/highlight/"+nf(i,3)+ ".png"); 
        }    
  //blocks
    //material block
      //base
        sprites.put("materialB",new PImage[9]);
        for (int i = 8; i >= 0; i--){
          sprites.get("materialB")[i] = loadImage("sprites/block/material/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("materialHighB",new PImage[9]);
        for (int i = 8; i >= 0; i--){
          sprites.get("materialHighB")[i] = loadImage("sprites/block/material/highlight/"+nf(i,3)+ ".png"); 
        }   
    //decor block
      //base
        sprites.put("decorB",new PImage[14]);
        for (int i = 13; i >= 0; i--){
          sprites.get("decorB")[i] = loadImage("sprites/block/decor/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("decorHighB",new PImage[14]);
        for (int i = 13; i >= 0; i--){
          sprites.get("decorHighB")[i] = loadImage("sprites/block/decor/highlight/"+nf(i,3)+ ".png"); 
        }  
    //light block
      //base
        sprites.put("lightB",new PImage[3]);
        for (int i = 2; i >= 0; i--){
          sprites.get("lightB")[i] = loadImage("sprites/block/light/base/"+nf(i,3)+ ".png"); 
        }  
      //highlight
        sprites.put("lightHighB",new PImage[3]);
        for (int i = 2; i >= 0; i--){
          sprites.get("lightHighB")[i] = loadImage("sprites/block/light/highlight/"+nf(i,3)+ ".png"); 
        }     
}  
