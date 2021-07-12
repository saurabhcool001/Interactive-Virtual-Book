// 4.14

import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;

int j;

Movie[] movie = new Movie[5];
boolean isPlaying4, isPlaying1, isPlaying2, isPlaying3, isPlaying5;
boolean mov0, mov1, mov2, mov3;
boolean check1, check2, check3, check4, check5;

PImage pframe;

void setup() {
  size(1920, 1080);
  background(0, 0, 0);
  colorMode(RGB, 100);
  frameRate(30);
  println(MultiMarker.VERSION);
  cam=new Capture(this, 640, 480);
  nya=new MultiMarker(this, 640, 480, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker(loadImage("3.png"), 16, 25, 80);
  nya.addARMarker(loadImage("4.png"), 16, 25, 80);
  nya.addARMarker(loadImage("1.jpg"), 16, 25, 80);
  nya.addARMarker(loadImage("2.png"), 16, 25, 80);
  nya.addARMarker(loadImage("6.jpg"), 16, 25, 80);

  cam.start();

  movie[0] = new Movie(this, "PAGE_01.mp4"); 
  movie[1] = new Movie(this, "PAGE_02.mp4");
  movie[2] = new Movie(this, "PAGE_03.mp4");
  movie[3] = new Movie(this, "PAGE_04.mp4");
  movie[4] = new Movie(this, "WHITE.mp4");


  isPlaying1 = false;
  isPlaying2 = false;
  isPlaying3 = false;
  isPlaying4 = false;
  isPlaying5 = false;

  check1 = false;
  check2 = false;
  check3 = false;
  check4 = false;
  check5 = false;
  mov0 = false;
}

void draw() {
  if (cam.available() !=true) {
    return;
  }
  cam.read();

  nya.detect(cam);
  background(255, 255, 255);
  image(cam, 1110, 0);
   background(0, 0, 0);
  image(movie[j], 107, 447);

  for (int i=0; i< 5; i++) {
    if ((!nya.isExist(i))) {
      continue;
    }
    j = i;
  } 

  if (j == 0 && isPlaying1 == false) {  
    isPlaying2 = false;
    isPlaying3 = false;
    isPlaying4 = false;
    isPlaying5 = false;

    if (check1 == false) {
      movie[1].pause();
      movie[1].jump(1);

      movie[2].pause();
      movie[2].jump(1);

      movie[3].pause();
      movie[3].jump(1);
      
      movie[4].pause();
      movie[4].jump(1);

      check1 = true;
      check2 = false;
      check3 = false;
      check4 = false;
      check5 = false;

      println("check 1 " + check1 + " time " + movie[1].time() );
    }
    if (movie[0].time( ) == movie[0].duration()) {
      movie[0].pause();
      movie[0].jump(1);
      isPlaying1 = true;
      println("mov 1 stoped ");
    } else {
      j = 0;
      if (mov0 == false) {
        j=4;
        mov0= true;
        movie[4].play();
        println("white movie");
      } else {
        movie[4].stop();
        println("movie 0 time is : " + movie[0].duration());
        movie[0].play();
        println("white movie stop");
      }
    }
  }//main if
  else if (j == 1 && isPlaying2 == false) {
    isPlaying1 = false;
    isPlaying3 = false;
    isPlaying4 = false;
    isPlaying5 = false;

    if (check2 == false) {
      movie[0].pause();
      movie[0].jump(1);

      movie[2].pause();
      movie[2].jump(1);

      movie[3].pause();
      movie[3].jump(1);
      
      movie[4].pause();
      movie[4].jump(1);

      check2 = true;
      check1 = false;
      check3 = false;
      check4 = false;
      check5 = false;
    }


    if (movie[1].time( ) == movie[1].duration()) {
      movie[1].pause();
      movie[1].jump(1);
      isPlaying2 = true;
      println("mov 1 stoped ");
    } else {
      j=1;
      println("movie 1 time is : " + movie[1].duration());
      movie[1].play();
    }
  }
  // mov 3 
  else if (j == 2 && isPlaying3 == false) {
    isPlaying1 = false;
    isPlaying2 = false;
    isPlaying4 = false;
    isPlaying5 = false;

    if (check3 == false) {
      movie[0].pause();
      movie[0].jump(1);

      movie[1].pause();
      movie[1].jump(1);

      movie[3].pause();
      movie[3].jump(1);
      
      movie[4].pause();
      movie[4].jump(1);

      check3 = true;
      check1 = false;
      check2 = false;
      check4 = false;
      check5 = false;
    }


    if (movie[2].time( ) == movie[2].duration()) {
      movie[2].pause();
      movie[2].jump(1);
      isPlaying3 = true;
      println("mov 2 stoped ");
    } else {
      j=2;
      println("movie 2 time is : " + movie[2].duration());
      movie[2].play();
    }
  }

  // mov 4
  else if (j == 3 && isPlaying4 == false) {
    isPlaying1 = false;
    isPlaying2 = false;
    isPlaying3 = false;
    isPlaying5 = false;

    if (check4 == false) {
      movie[0].pause();
      movie[0].jump(1);

      movie[1].pause();
      movie[1].jump(1);

      movie[2].pause();
      movie[2].jump(1);
      
      movie[4].pause();
      movie[4].jump(1);

      check4 = true;
      check1 = false;
      check2 = false;
      check3 = false;
      check5 = false;
    }


    if (movie[3].time( ) == movie[3].duration()) {
      movie[3].pause();
      movie[3].jump(1);
      isPlaying4 = true;
      println("mov 3 stoped ");
    } else {
      j=3;
      println("movie 3 time is : " + movie[3].duration());
      movie[3].play();
    }
  }
  
   else if (j == 4 && isPlaying5 == false) {
    
    isPlaying1 = false;
    isPlaying3 = false;
    isPlaying4 = false;
    isPlaying2 = false;

    if (check5 == false) {
      movie[0].pause();
      movie[0].jump(1);
      
      movie[1].pause();
      movie[1].jump(1);

      movie[2].pause();
      movie[2].jump(1);

      movie[3].pause();
      movie[3].jump(1);

      check5 = true;
      check1 = false;
      check2 = false;
      check3 = false;
      check4 = false;
    }
    
    if (movie[4].time( ) == movie[4].duration()) {
      movie[4].pause();
      movie[4].jump(1);
      isPlaying5 = true;
      println("mov 5 stoped ");
    } else {
      j=4;
      println("movie 5 time is : " + movie[4].duration());
      movie[4].play();
    }
  }
}

void movieEvent(Movie m) {

  m.read();
}
}