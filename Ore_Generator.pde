import java.util.Map;

HashMap<String,PImage[]> sprites = new HashMap<String,PImage[]>();
HashMap<String,Float> effectsValue = new HashMap<String,Float>();
String[] spawnables = new String[10];
String[] effects = new String[29];

Material material;
Ore ore;
Tool tool;
Block block;

PFont bigF;
PFont mediumF;
PFont littleF;

String[] conChunk;
String[] vowChunk;
String[] endChunk;

int selPage;
int numPages;
void settings(){
  size(700,900);
  noSmooth();
}
void setup(){
  setNameChunks();
  loadSprites();
  setEffects();
  setSpawnables();
  
  selPage = 0;
  numPages = 1;

  bigF = createFont("Damascus", 38);
  mediumF = createFont("Damascus", 24);
  littleF = createFont("Damascus", 20);
  
  loadStuff();
}  
void draw(){
  noStroke();
  fill(20,25,45);
  rect(0,0,width,height);
  if (selPage == 0){
    material.mMain();
  }
  else if (selPage == 1){
    ore.oMain();
  }  
  else if (material.uTools && selPage == tool.page){
    tool.tMain();  
  }  
  else if ((material.uBlock || material.uDecor || material.uLight) && selPage == block.page){
    block.bMain();  
  }  
}  
