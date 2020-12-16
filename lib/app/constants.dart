import 'dart:math';

String getAmaedola() {
  Random random = new Random();
  int randomNr = random.nextInt(10) + 1;

  if (randomNr == 1) {
    return 'hönö mböwö \nno awai, \nba hönö mböwö \nno tosai';
  } else if (randomNr == 2) {
    return 'kauko ba hili, \nkauko ba ndraso, \nöfaolo göi ndra\'ugö, \nba ufaolo göi ndra\'o';
  } else if (randomNr == 3) {
    return 'ligi-ligi siliŵi, \nfa lö tofesu mbagi, \nhese-hese nazese, \nfa lö tofesu gahe';
  } else if (randomNr == 4) {
    return 'hulö la\'eŵa \ndalu nidanö, \nifuli \nfahalö-halö';
  } else if (randomNr == 5) {
    return 'alaŵa luo \nafeto duo, \naisö \nnidanö mbanio';
  } else if (randomNr == 6) {
    return 'aramba Luo Mewöna \naramba Luo Holi, \nlahole-hole wamözi \nfategaölö-gaölö li';
  } else if (randomNr == 7) {
    return 'belu gia belu dugala \nbelu gia belu damo, \nda\'ö sibai zomasido \nsagalio mamazibo';
  } else if (randomNr == 8) {
    return 'bulu mbala hili \nbulu mbala ndraso, \nbali-bali ba lelau \nhe zami he zafeto';
  } else if (randomNr == 9) {
    return 'hulö famanö-manö ci\'a-ci\'a \nhulö fahuhuo mbayakomo, \nlö adudu \nba lö aroro';
  } else if (randomNr == 10) {
    return 'hulö mate manu ndrawa \nmöi horö zokata-kata';
  } else {
    return 'hulö la\'eŵa \ndalu nidanö, \nifuli \nfahalö-halö';
  }
}

String getBackgroundImage() {
  Random random = new Random();
  int randomNr = random.nextInt(7) + 1;

  if (randomNr == 1) {
    return 'beach1.jpg';
  } else if (randomNr == 2) {
    return 'beach2.jpg';
  } else if (randomNr == 3) {
    return 'book1.jpg';
  } else if (randomNr == 4) {
    return 'book2.jpg';
  } else if (randomNr == 5) {
    return 'child1.jpg';
  } else if (randomNr == 6) {
    return 'children1.jpg';
  } else if (randomNr == 7) {
    return 'children2.jpg';
  } else {
    return 'book2.jpg';
  }
}
