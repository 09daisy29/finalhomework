import processing.pdf.*;

PFont font, font1, font2,font3,font4, arrowFont;

//location of image
//float locX, locY;
//velocity of image
//float velX, velY;
//size of image
int diameter=60;
//clicakble area
int bounds=diameter;

PImage img, img2, img3, img4;
PImage imgemoji, imgemoji2, imgemoji3;
PImage graphics;

PGraphics pg;
PGraphics pat;


public void settings(){
    size(840, 1000);
}
void setup() {

 
  font1=createFont("宋体",40);
   font2=createFont("微软雅黑",35);
  font3=createFont("微软雅黑",70);
   font4=createFont("宋体",40);
  font=font1;
  textFont(font);

  fill(0);

  arrowFont = createFont("FreeSans.ttf", 32);

  img = loadImage("imgButton.png");
  img2 = loadImage("imgButton2.png");
  img3 = loadImage("imgButton3.png");
  img4 = loadImage("imgButton4.png");

 

  graphics = loadImage("first.png"); 

//  locX=180;
 // locY=180;

  pg = createGraphics(590, 1000);
  pat = createGraphics(700, 1000);
}

int drawcolor=#40FFDA;
int fcolor=#0A14FF;
int typesize=20;
//int font=font1;
int align=CENTER;
int SIZE=30; //button size
int edge=20; //DISTance from edge
int DIST=100; //DISTance between each category
int pdfC=0;

void draw() {

  stroke(0);
  background(#E8E8E8);

  int colors[]={#000000, #E83EFF, #40FFDA, #FAFF0D, #FFFFFF}, 
    n;

  int fontcolors[]={#000000, #FF0AF3, #0A14FF, #FAFF0D, #FFFFFF}, 
    f;
 


  //close button
  //rect(edge,edge,SIZE,SIZE);
  strokeWeight(2);
  line(edge, edge, SIZE+edge, SIZE+edge);
  line(SIZE+edge, edge, edge, SIZE+edge);

  //bg color selector
  textFont(arrowFont);
  textSize(10);
  text("BG", edge, edge+SIZE+DIST-60);
  for (n=0; n<colors.length; n++)
  {
    //stroke(0);
    fill(colors[n]);
    //rect(width-SIZE,n*SIZE, SIZE,SIZE);
    rect(edge, n*SIZE+DIST, SIZE, SIZE);
  }

  //font color selector
  textFont(arrowFont);
  textSize(10);
  fill(0);
  text("wordscolour", edge+SIZE+20, edge+SIZE+DIST-60);
  for (f=0; f<fontcolors.length; f++)
  {
    fill(fontcolors[f]);
    rect(edge+SIZE+20, f*SIZE+DIST, SIZE, SIZE);
  }


  //image button
  textFont(arrowFont);
  textSize(10);
  fill(0);
  text("IMG", edge, edge+340-60);
  img.resize(SIZE+2, 0);
  image(img, edge, edge+(SIZE*3)+(DIST*2));
  img2.resize(SIZE+2, 0);
  image(img2, edge+SIZE, edge+(SIZE*3)+(DIST*2));
  
  //draggable 


  img3.resize(SIZE+2, 0);
  image(img3, edge+2*SIZE+10, edge+(SIZE*3)+(DIST*2));
  img4.resize(SIZE+2, 0);
  image(img4, edge+3*SIZE+10, edge+(SIZE*3)+(DIST*2));
  
 

  

  //typeface
  //font1
  textFont(font1);
  textSize(15);
  fill(255);
  rect(edge+50-40, edge+380, SIZE, SIZE);
  fill(0);
    text("P1", edge+54-48, edge+335);
      text("P2", edge+54-15, edge+335);
         text("P3", edge+80, edge+335);
            text("P4", edge+110, edge+335);
   text("字体", edge+54-40, edge+375);
  text("Aa", edge+54-40, edge+403);
  //font2
  textFont(font2);

  textSize(20);
  fill(255);
  rect(edge+80-40, edge+380, SIZE, SIZE);
  fill(0);
  text("Aa", edge+83-40, edge+403);

  //alignment
  textFont(arrowFont);
  textSize(10);
  fill(0);
  text("ALIGN", edge, edge+470-10);
  //left
  fill(255);
  rect(edge, edge+470, SIZE, SIZE);
  strokeWeight(2);
  line(edge+7, edge+479, edge+SIZE-15, edge+479);
  line(edge+7, edge+485, edge+SIZE-10, edge+485);
  line(edge+7, edge+491, edge+SIZE-15, edge+491);
  //center
  fill(255);
  rect(edge+SIZE, edge+470, SIZE, SIZE);
  strokeWeight(2);
  line(edge+SIZE+10, edge+479, edge+SIZE+SIZE-11, edge+479);
  line(edge+SIZE+8, edge+485, edge+SIZE+SIZE-9, edge+485);
  line(edge+SIZE+10, edge+491, edge+SIZE+SIZE-11, edge+491);
  //right
  fill(255);
  rect(edge+2*SIZE, edge+470, SIZE, SIZE);
  strokeWeight(2);
  line(edge+3*SIZE-7, edge+479, edge+3*SIZE-15, edge+479);
  line(edge+3*SIZE-7, edge+485, edge+3*SIZE-20, edge+485);
  line(edge+3*SIZE-7, edge+491, edge+3*SIZE-15, edge+491);


  //save pdf button
  textFont(arrowFont);
  textSize(10);
  fill(0);
  text("SAVE PDF", edge, edge+650-10);
  fill(255);
  rect(edge, edge+650, 70, SIZE);
  textFont(font1);
  textSize(18);
  fill(0);
  text("print", edge+8, edge+670);



  int pgwidth = 595;
//  int pgheight = height;

  pg.beginDraw();
  pg.background(drawcolor);
  pg.image(graphics, 80, 80);
//  pg.text(myText[0], 0, 10,600, 1400);
  //pg.text(myText, 90,0, 410,height);
  pg.textFont(font3);
    pg. text("创意编程", 300,20);
pg.textFont(font4);

pg.text("P1:学习蒙德里安",150,630);
pg.text("P2:静态与动态图像-创意图像",260,680);
pg.text("P3:静态与动态图像-创意图像(续)",300,730);
pg.text("P4:交互-基本交互设计",200,780);
  pg.textFont(font);
   pg.text("戴淑妍/Daisy 时间:2023/1/11", 300,850);
    pg.text("指导老师：张立群", 300,900);
  pg.textAlign(align, CENTER);
  pg.fill(fcolor);
  pg.textSize(typesize);

  



  pg.image(pat, 0, 0);

  pg.endDraw();
  image(pg, width-pgwidth, 0);
 



  if (mousePressed)
  {   
    //close
    if (inside(edge, edge, SIZE+edge, SIZE+edge))//exit
    {
      exit();
    }

    //bg color selector
    for (n=0; n<colors.length; n++)
    {
      //rect(edge,n*SIZE+DIST, SIZE,SIZE);
      if (inside(edge, n*SIZE+DIST, edge+SIZE, n*SIZE+DIST+SIZE))
      { 
        drawcolor=colors[n];
      }
    }

    //font color selector
    for (f=0; f<fontcolors.length; f++)
    {
      //rect(edge+SIZE+20,f*SIZE+DIST, SIZE,SIZE);
      if (inside(edge+SIZE+20, f*SIZE+DIST, edge+2*SIZE+20, f*SIZE+DIST+SIZE))
      { 
        fcolor=fontcolors[f];
      }
    }


    //image
    if (inside(edge, edge+(SIZE*3)+(DIST*2), edge+SIZE, edge+(SIZE*4)+(DIST*2)))
    {
      graphics= loadImage("first.png");
      
    }
    if (inside(edge+SIZE, edge+(SIZE*3)+(DIST*2), edge+2*SIZE, edge+(SIZE*4)+(DIST*2)))
    {
      graphics= loadImage("second.png");
      
    }

    if (inside(edge+2*SIZE+10, edge+(SIZE*3)+(DIST*2), edge+3*SIZE+10, edge+(SIZE*4)+(DIST*2)))
    {
      graphics= loadImage("third.png");
    }
    if (inside(edge+3*SIZE+10, edge+(SIZE*3)+(DIST*2), edge+4*SIZE+10, edge+(SIZE*4)+(DIST*2)))
    {
      graphics= loadImage("forth.png");
    }


    //type size
    // rect(edge, edge+380, SIZE/1.5, SIZE);
    //rect(edge,edge+380, SIZE/1.5,SIZE);
    if (inside(edge, edge+380, edge+20, edge+380+SIZE) && typesize<=100)
    {
      typesize=typesize+1;
    }
    //rect(edge+20, edge+380, SIZE/1.5, SIZE);
    if (inside(edge+20, edge+380, edge+20+20, edge+380+SIZE) && typesize>=10)
    {
      typesize=typesize-1;
    }

    //text alignment
    //left
    //rect(edge,edge+470, SIZE,SIZE);
    if (inside(edge, edge+470, edge+SIZE, edge+470+SIZE))
    {
      align=LEFT;
    }
    //center
    //rect(edge+SIZE, edge+470, SIZE, SIZE);
    if (inside(edge+SIZE, edge+470, edge+2*SIZE, edge+470+SIZE))
    {
      align=CENTER;
    }
    //right
    //rect(edge+2*SIZE, edge+470, SIZE, SIZE);
    if (inside(edge+2*SIZE, edge+470, edge+3*SIZE, edge+470+SIZE))
    {
      align=RIGHT;
    }

    //typeface
    //rect(edge+50,edge+380, SIZE,SIZE);
    if (inside(edge+50-40, edge+380, edge+50+SIZE, edge+380+SIZE))
    {
      font=font1;
    }
    //rect(edge+80,edge+380, SIZE,SIZE);
    if (inside(edge+80-40, edge+380, edge+80+SIZE, edge+380+SIZE))
    {
      font=font2;
    }


   

   
    //pattern none
    //ellipse(edge+2*SIZE+35, edge+580, SIZE+2, SIZE+2);
    if (inside(edge+2*SIZE+20, edge+565, edge+3*SIZE+20, edge+565+SIZE))
    {
      pat = createGraphics(595, 842);
      pat.beginDraw();
      pat.clear();
      pat.endDraw();
    }

    //rect(edge,edge+650, 70,SIZE);
    if (mouseX>edge && mouseY>edge+650 && mouseX<edge+70 && mouseX<edge+650+SIZE)
    {        // When a mouse button is pressed,
      String date = new java.text.SimpleDateFormat("dd:MM:yy_H'h'm'm's's'").format(new java.util.Date ());
      PGraphics pdf = createGraphics(840, 900, PDF, "print/MyKoolPoster_" + date + ".pdf");
      //PGraphics pdf = createGraphics(595, height, PDF, "PrettyKoolPoster" +pdfC + ".pdf");
      pdf.beginDraw();
      pdf.image(pg, 0, 0);
      pdf.dispose();
      pdf.endDraw();
      //pdfC++;
    }
  }
}
